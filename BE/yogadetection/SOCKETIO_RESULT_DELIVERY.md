# Socket.IO - Real-time Pose Result Delivery

## Tổng Quan
Hệ thống sử dụng **Socket.IO** (HTTP long-polling/WebSocket) để gửi kết quả chấm điểm real-time từ server về mobile client.

**Socket.IO vs WebSocket:**
- Socket.IO: HTTP-based, fallback to long-polling, cross-platform
- WebSocket: Binary protocol, không fallback
- ✅ Đang dùng: **Socket.IO** (netty-socketio)

---

## Server Configuration

### Port & Host
```
Host: 0.0.0.0
Port: 9080
URL: http://localhost:9080
```

### Authentication
- JWT token gửi qua **HTTP Headers**: `Authorization: Bearer <token>`
- Server validate token trong `ConnectSocketEvent`
- Nếu token invalid → disconnect ngay lập tức

---

## Connection Setup

### React Native / JavaScript

```javascript
import io from 'socket.io-client';

const token = await AsyncStorage.getItem('jwt_token');

const socket = io('http://YOUR_SERVER:9080', {
  transportOptions: {
    polling: {
      extraHeaders: {
        'Authorization': token  // Gửi JWT qua header
      }
    }
  },
  autoConnect: true,
  reconnection: true,
  reconnectionDelay: 1000,
  reconnectionAttempts: 5
});

// Connection events
socket.on('connect', () => {
  console.log('✅ Socket.IO connected:', socket.id);
});

socket.on('disconnect', (reason) => {
  console.log('❌ Socket.IO disconnected:', reason);
});

socket.on('connect_error', (error) => {
  console.error('Connection error:', error.message);
});
```

### Flutter

```dart
import 'package:socket_io_client/socket_io_client.dart' as IO;

String token = await storage.read(key: 'jwt_token');

IO.Socket socket = IO.io('http://YOUR_SERVER:9080', 
  IO.OptionBuilder()
    .setTransports(['polling', 'websocket'])
    .setExtraHeaders({'Authorization': token})
    .enableAutoConnect()
    .enableReconnection()
    .setReconnectionDelay(1000)
    .setReconnectionAttempts(5)
    .build()
);

socket.onConnect((_) {
  print('✅ Socket.IO connected');
});

socket.onDisconnect((_) {
  print('❌ Socket.IO disconnected');
});

socket.onConnectError((data) {
  print('Connection error: $data');
});
```

---

## Events

### 1. `pose_result` (Server → Client)

Gửi khi AI chấm điểm xong.

**Payload:**
```json
{
  "type": "pose_result",
  "attemptId": "018c1234-5678-90ab-cdef-1234567890ab",
  "poseName": "Mountain Pose",
  "score": 85.5,
  "feedback": "Tư thế tốt! Điểm mạnh: Lưng thẳng, vai cân bằng. Cần cải thiện: Căng chân đều hơn.",
  "timestamp": 1698765432000
}
```

**Client Listener:**
```javascript
socket.on('pose_result', (data) => {
  console.log('📊 Received pose result:', data);
  
  // Hiển thị result screen
  navigation.navigate('PoseResult', {
    attemptId: data.attemptId,
    poseName: data.poseName,
    score: data.score,
    feedback: data.feedback
  });
  
  // Hoặc show modal/bottom sheet
  showResultModal(data);
});
```

**Flutter:**
```dart
socket.on('pose_result', (data) {
  print('📊 Pose Result: ${data['score']}/100');
  
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PoseResultScreen(
        attemptId: data['attemptId'],
        poseName: data['poseName'],
        score: data['score'],
        feedback: data['feedback'],
      ),
    ),
  );
});
```

---

## Complete Workflow

### Step 1: Connect Socket.IO khi App Start
```javascript
import { useEffect, useRef } from 'react';
import io from 'socket.io-client';

function App() {
  const socket = useRef(null);

  useEffect(() => {
    const token = await AsyncStorage.getItem('jwt_token');
    
    socket.current = io('http://YOUR_SERVER:9080', {
      transportOptions: {
        polling: {
          extraHeaders: { 'Authorization': token }
        }
      }
    });

    socket.current.on('connect', () => {
      console.log('Socket connected');
    });

    socket.current.on('pose_result', (data) => {
      // Handle result
      handlePoseResult(data);
    });

    return () => {
      socket.current.disconnect();
    };
  }, []);
}
```

### Step 2: Upload Pose qua REST API
```javascript
const uploadPose = async (image, landmarks, poseCode) => {
  const formData = new FormData();
  formData.append('poseCode', poseCode);
  formData.append('image', {
    uri: image.uri,
    type: 'image/jpeg',
    name: 'pose.jpg',
  });
  
  const landmarkBlob = new Blob([JSON.stringify({
    poseId: 1,
    landmarks: landmarks,
    timestamp: Date.now()
  })], { type: 'application/json' });
  formData.append('landmarkData', landmarkBlob);

  // Show loading
  setLoading(true);

  try {
    const response = await fetch('http://YOUR_SERVER:9090/api/pose-attempts', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${token}`,
      },
      body: formData,
    });

    // Không cần đợi response
    // Kết quả sẽ đến qua Socket.IO event 'pose_result'
    console.log('Upload started, waiting for Socket.IO result...');
    
  } catch (error) {
    console.error('Upload failed:', error);
    setLoading(false);
  }
};
```

### Step 3: Nhận Kết Quả qua Socket.IO
```javascript
socket.on('pose_result', (data) => {
  // Hide loading
  setLoading(false);
  
  // Show result
  Alert.alert(
    `🎯 ${data.poseName}`,
    `Điểm: ${data.score}/100\n\n${data.feedback}`,
    [
      { text: 'Xem chi tiết', onPress: () => navigateToDetail(data.attemptId) },
      { text: 'OK' }
    ]
  );
});
```

### Step 4: Nhận Push Notification (Backup)
```javascript
// FCM handler (nếu app đang background)
messaging().onMessage(async remoteMessage => {
  console.log('FCM notification:', remoteMessage.notification.title);
  // "🎯 Kết quả: Mountain Pose"
  // "Điểm: 85.5/100 - Tư thế tốt!..."
});
```

---

## Full React Native Example

```javascript
import React, { useEffect, useRef, useState } from 'react';
import { View, Text, Button, ActivityIndicator } from 'react-native';
import io from 'socket.io-client';

const PoseUploadScreen = () => {
  const socket = useRef(null);
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState(null);

  useEffect(() => {
    // Connect Socket.IO
    const initSocket = async () => {
      const token = await AsyncStorage.getItem('jwt_token');
      
      socket.current = io('http://192.168.1.100:9080', {
        transportOptions: {
          polling: {
            extraHeaders: { 'Authorization': token }
          }
        }
      });

      socket.current.on('connect', () => {
        console.log('✅ Socket.IO connected');
      });

      socket.current.on('pose_result', (data) => {
        console.log('📊 Pose result received:', data);
        setLoading(false);
        setResult(data);
      });

      socket.current.on('connect_error', (err) => {
        console.error('Socket connection error:', err.message);
      });
    };

    initSocket();

    return () => {
      if (socket.current) {
        socket.current.disconnect();
      }
    };
  }, []);

  const uploadPose = async () => {
    setLoading(true);
    setResult(null);

    const formData = new FormData();
    formData.append('poseCode', 'pose-uuid-here');
    formData.append('image', {
      uri: 'file:///path/to/image.jpg',
      type: 'image/jpeg',
      name: 'pose.jpg',
    });

    try {
      await fetch('http://192.168.1.100:9090/api/pose-attempts', {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${await AsyncStorage.getItem('jwt_token')}`,
        },
        body: formData,
      });
      
      console.log('Uploaded! Waiting for Socket.IO result...');
    } catch (error) {
      console.error('Upload error:', error);
      setLoading(false);
    }
  };

  return (
    <View style={{ padding: 20 }}>
      <Button title="Upload Pose" onPress={uploadPose} />
      
      {loading && (
        <View style={{ marginTop: 20 }}>
          <ActivityIndicator size="large" />
          <Text>Đang chấm điểm...</Text>
        </View>
      )}

      {result && (
        <View style={{ marginTop: 20, padding: 10, backgroundColor: '#f0f0f0' }}>
          <Text style={{ fontSize: 18, fontWeight: 'bold' }}>
            {result.poseName}
          </Text>
          <Text style={{ fontSize: 24, color: 'green', marginVertical: 10 }}>
            Điểm: {result.score}/100
          </Text>
          <Text>{result.feedback}</Text>
        </View>
      )}
    </View>
  );
};

export default PoseUploadScreen;
```

---

## Full Flutter Example

```dart
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class PoseUploadScreen extends StatefulWidget {
  @override
  _PoseUploadScreenState createState() => _PoseUploadScreenState();
}

class _PoseUploadScreenState extends State<PoseUploadScreen> {
  IO.Socket? socket;
  bool loading = false;
  Map<String, dynamic>? result;

  @override
  void initState() {
    super.initState();
    initSocket();
  }

  void initSocket() async {
    String token = await storage.read(key: 'jwt_token') ?? '';
    
    socket = IO.io('http://192.168.1.100:9080', 
      IO.OptionBuilder()
        .setTransports(['polling', 'websocket'])
        .setExtraHeaders({'Authorization': token})
        .enableAutoConnect()
        .build()
    );

    socket!.onConnect((_) {
      print('✅ Socket.IO connected');
    });

    socket!.on('pose_result', (data) {
      print('📊 Pose result: ${data['score']}/100');
      setState(() {
        loading = false;
        result = data;
      });
    });

    socket!.onConnectError((err) {
      print('Socket error: $err');
    });
  }

  Future<void> uploadPose() async {
    setState(() {
      loading = true;
      result = null;
    });

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.1.100:9090/api/pose-attempts'),
    );

    String token = await storage.read(key: 'jwt_token') ?? '';
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['poseCode'] = 'pose-uuid-here';
    request.files.add(await http.MultipartFile.fromPath('image', '/path/to/image.jpg'));

    try {
      await request.send();
      print('Uploaded! Waiting for Socket.IO result...');
    } catch (e) {
      print('Upload error: $e');
      setState(() { loading = false; });
    }
  }

  @override
  void dispose() {
    socket?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Pose')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: uploadPose,
              child: Text('Upload Pose'),
            ),
            
            if (loading)
              Column(
                children: [
                  SizedBox(height: 20),
                  CircularProgressIndicator(),
                  Text('Đang chấm điểm...'),
                ],
              ),
            
            if (result != null)
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result!['poseName'],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Điểm: ${result!['score']}/100',
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    ),
                    SizedBox(height: 10),
                    Text(result!['feedback']),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
```

---

## Testing

### 1. Test Connection với Postman
Socket.IO không support trực tiếp trong Postman, dùng tool khác:

```bash
# Install socket.io-client CLI
npm install -g socket.io-client

# Test connection
socket-io-client http://localhost:9080 \
  --extraHeaders '{"Authorization":"Bearer YOUR_JWT_TOKEN"}'
```

### 2. Test với Browser Console
```javascript
<script src="https://cdn.socket.io/4.5.4/socket.io.min.js"></script>
<script>
  const socket = io('http://localhost:9080', {
    transportOptions: {
      polling: {
        extraHeaders: {
          'Authorization': 'Bearer YOUR_JWT_TOKEN'
        }
      }
    }
  });

  socket.on('connect', () => {
    console.log('Connected:', socket.id);
  });

  socket.on('pose_result', (data) => {
    console.log('Result:', data);
  });
</script>
```

### 3. Test Full Flow
```bash
# Terminal 1: Start Spring Boot
./mvnw spring-boot:run

# Terminal 2: Connect Socket.IO
socket-io-client http://localhost:9080 \
  --extraHeaders '{"Authorization":"Bearer YOUR_TOKEN"}'

# Terminal 3: Upload pose
curl -X POST http://localhost:9090/api/pose-attempts \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -F "poseCode=xxx" \
  -F "image=@pose.jpg" \
  -F "landmarkData=@landmarks.json"

# Check Terminal 2 → Sẽ nhận event 'pose_result'
```

---

## Troubleshooting

### Problem: Cannot connect to Socket.IO
**Check:**
```bash
# Port 9080 có đang listen không?
netstat -an | findstr 9080

# Firewall có block không?
# CORS có cho phép origin không?
```

**Solution:**
- Đảm bảo Spring Boot đã start
- Check `SocketConfig.java` port = 9080
- Thử connect từ browser console

### Problem: Connection bị disconnect ngay
**Cause:** JWT token invalid

**Check logs:**
```
WebSocket authentication failed: JWT expired
```

**Solution:**
- Refresh JWT token
- Check token format: "Bearer <token>" hoặc chỉ "<token>"
- Verify token chưa expire

### Problem: Không nhận event `pose_result`
**Check:**
1. User có đang connect không?
   ```java
   socketIOService.isUserConnected(userId); // should return true
   ```

2. Check logs:
   ```
   Sent pose result to user XXX via Socket.IO: score=85.5
   ```

3. Client có listen event không?
   ```javascript
   socket.on('pose_result', (data) => { ... });
   ```

---

## Security Notes

1. **JWT Authentication:**
   - Token gửi qua HTTP header `Authorization`
   - Validate trong `ConnectSocketEvent`
   - Auto disconnect nếu invalid

2. **User Isolation:**
   - Mỗi user chỉ nhận results của chính mình
   - userId lưu trong `client.set(ParamKey.USER_ID, userId)`

3. **No Sensitive Data:**
   - Không gửi password, raw token qua Socket.IO
   - Chỉ gửi public info (score, feedback)

---

## Performance Considerations

1. **Connection Pool:**
   - In-memory `CONNECTION_STATE` map
   - Auto cleanup khi disconnect
   - Consider Redis cho production scaling

2. **Message Size:**
   - Feedback text có thể dài (>1KB)
   - Consider gzip compression

3. **Reconnection:**
   - Client auto-reconnect nếu mất kết nối
   - Server maintain state cho 30s (configurable)

---

## Comparison: Socket.IO vs Spring WebSocket

| Feature | Socket.IO (Đang dùng) | Spring WebSocket |
|---------|----------------------|------------------|
| Protocol | HTTP long-polling → WebSocket | WebSocket only |
| Fallback | ✅ Auto fallback to polling | ❌ No fallback |
| Mobile Support | ✅ Excellent | ⚠️ Có thể bị block |
| Browser Support | ✅ All browsers | ⚠️ Modern only |
| Auth | HTTP Headers | Query params |
| Library | socket.io-client | native WebSocket |
| **Recommendation** | ✅ Use for mobile apps | Use for web apps |

---

## Next Steps

- [ ] Add reconnection logic với exponential backoff
- [ ] Implement message acknowledgment (ACK)
- [ ] Add event `ping`/`pong` để keep-alive
- [ ] Setup Redis adapter cho horizontal scaling
- [ ] Add analytics tracking (events sent/received)
- [ ] Implement message queue cho offline users
