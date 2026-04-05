package com.yogadetection.service.impl;

import org.springframework.stereotype.Component;
import java.util.HashMap;
import java.util.Map;

/**
 * Thư viện chứa thông tin về góc chuẩn của các tư thế Yoga phổ biến.
 * Giúp AI có căn cứ so sánh chính xác hơn.
 */
@Component
public class PoseStandardLibrary {

    private final Map<String, String> standardAngles = new HashMap<>();

    public PoseStandardLibrary() {
        initStandards();
    }

    private void initStandards() {
        // 1. Mountain Pose (Tadasana - Tư thế trái núi)
        String mountain = """
            - Cơ thể: Tạo thành một đường thẳng từ đỉnh đầu đến gót chân.
            - Hai chân: Khép sát hoặc mở rộng bằng hông, song song nhau.
            - Hai tay: Buông xuôi theo thân, lòng bàn tay hướng vào đùi hoặc hướng ra trước.
            - Vai: Thả lỏng, xa tai.
            """;
        addStandard("mountain pose", mountain);
        addStandard("tadasana", mountain);
        addStandard("trái núi", mountain);

        // 2. Camel Pose (Ustrasana - Tư thế lạc đà)
        String camel = """
            - Đầu gối: Mở rộng bằng hông, đùi vuông góc với sàn (~90°).
            - Lưng: Uốn cong về sau, ngực mở rộng.
            - Tay: Nắm lấy gót chân hoặc đặt lên lưng dưới (biến thể dễ).
            - Cổ: Thả lỏng ra sau (nếu thoải mái) hoặc giữ thẳng.
            """;
        addStandard("camel pose", camel);
        addStandard("ustrasana", camel);
        addStandard("lạc đà", camel);

        // 3. Fish Pose (Matsyasana - Tư thế con cá)
        String fish = """
            - Chân: Duỗi thẳng và khép sát (hoặc xếp bằng/hoa sen).
            - Ngực: Nâng cao, uốn cong lưng trên.
            - Đỉnh đầu: Chạm nhẹ xuống sàn.
            - Khuỷu tay: Chống xuống sàn để hỗ trợ nâng ngực.
            """;
        addStandard("fish pose", fish);
        addStandard("matsyasana", fish);
        addStandard("con cá", fish);

        // 4. Crow Pose (Bakasana - Tư thế con quạ)
        String crow = """
            - Tay: Chống thẳng hoặc hơi trùng, chịu toàn bộ trọng lượng cơ thể.
            - Đầu gối: Đặt lên bắp tay sau (triceps) hoặc nách.
            - Chân: Nhấc khỏi sàn, ngón chân cái chạm nhau.
            - Mắt: Nhìn về phía trước, không nhìn xuống dưới.
            """;
        addStandard("crow pose", crow);
        addStandard("bakasana", crow);
        addStandard("con quạ", crow);

        // 5. Pigeon Pose (Eka Pada Rajakapotasana - Tư thế bồ câu)
        String pigeon = """
            - Chân trước: Gập lại, ống chân nằm ngang hoặc chéo.
            - Chân sau: Duỗi thẳng ra sau (~180°), mu bàn chân úp xuống.
            - Hông: Cân bằng, hướng thẳng về phía trước (không lệch mông).
            - Lưng: Thẳng hoặc uốn cong nhẹ về sau.
            """;
        addStandard("pigeon pose", pigeon);
        addStandard("eka pada rajakapotasana", pigeon);
        addStandard("bồ câu", pigeon);

        // 6. Reclined Twist (Supta Matsyendrasana - Vặn mình khi nằm)
        String reclinedTwist = """
            - Lưng: Nằm ngửa trên sàn.
            - Chân: Một chân co gập qua bên đối diện.
            - Vai: Cả hai vai giữ sát sàn (quan trọng).
            - Đầu: Xoay về hướng ngược lại với chân co.
            """;
        addStandard("reclined twist", reclinedTwist);
        addStandard("supta matsyendrasana", reclinedTwist);
        addStandard("vặn mình", reclinedTwist);

        // 7. Happy Baby (Ananda Balasana - Em bé hạnh phúc)
        String happyBaby = """
            - Lưng: Toàn bộ cột sống áp sát sàn.
            - Chân: Gập gối, hướng về phía nách.
            - Bàn chân: Hướng lên trần nhà, cẳng chân vuông góc với sàn (~90°).
            - Tay: Nắm lấy cạnh ngoài bàn chân.
            """;
        addStandard("happy baby", happyBaby);
        addStandard("ananda balasana", happyBaby);
        addStandard("em bé hạnh phúc", happyBaby);

        // 8. Upward Dog (Urdhva Mukha Svanasana - Chó ngửa mặt)
        String upwardDog = """
            - Tay: Duỗi thẳng (~180°), vai thẳng hàng cổ tay.
            - Chân: Duỗi thẳng ra sau, mu bàn chân ấn xuống sàn.
            - Đùi & Đầu gối: Nhấc khỏi sàn (quan trọng).
            - Ngực: Mở rộng về phía trước.
            """;
        addStandard("upward dog", upwardDog);
        addStandard("urdhva mukha svanasana", upwardDog);
        addStandard("chó ngửa mặt", upwardDog);

        // 9. Locust Pose (Salabhasana - Tư thế châu chấu)
        String locust = """
            - Bụng: Nằm sấp trên sàn.
            - Chân: Duỗi thẳng và nâng cao khỏi sàn.
            - Ngực & Đầu: Nâng cao khỏi sàn.
            - Tay: Duỗi thẳng ra sau, song song với thân người.
            """;
        addStandard("locust pose", locust);
        addStandard("salabhasana", locust);
        addStandard("châu chấu", locust);

        // 10. Bow Pose (Dhanurasana - Tư thế cánh cung)
        String bow = """
            - Bụng: Nằm sấp trên sàn.
            - Chân: Gập gối, gót chân hướng về mông.
            - Tay: Nắm lấy cổ chân.
            - Ngực & Đùi: Nâng cao khỏi sàn, tạo hình cánh cung.
            """;
        addStandard("bow pose", bow);
        addStandard("dhanurasana", bow);
        addStandard("cánh cung", bow);

        // 11. Sphinx Pose (Salamba Bhujangasana - Nhân sư)
        String sphinx = """
            - Bụng & Hông: Áp sát sàn.
            - Cẳng tay: Đặt song song trên sàn, rộng bằng vai.
            - Khuỷu tay: Vuông góc dưới vai (~90°).
            - Ngực: Nâng lên nhẹ nhàng.
            """;
        addStandard("sphinx pose", sphinx);
        addStandard("salamba bhujangasana", sphinx);
        addStandard("nhân sư", sphinx);

        // 12. Standing Forward Bend (Uttanasana - Đứng gập người)
        String forwardBend = """
            - Chân: Thẳng (~180°) hoặc hơi trùng nhẹ nếu gân kheo cứng.
            - Hông: Gập từ hông (không phải từ eo).
            - Lưng: Cố gắng duỗi dài cột sống.
            - Đầu: Thả lỏng hướng xuống sàn.
            """;
        addStandard("standing forward bend", forwardBend);
        addStandard("uttanasana", forwardBend);
        addStandard("đứng gập người", forwardBend);

        // 13. Triangle Revolved (Parivrtta Trikonasana - Tam giác vặn)
        String revolvedTriangle = """
            - Chân: Hai chân duỗi thẳng (~180°).
            - Hông: Cố gắng giữ cân bằng.
            - Thân trên: Vặn xoắn về phía chân trước.
            - Tay: Một tay chạm sàn/chân, tay kia vươn lên trần (thẳng hàng).
            """;
        addStandard("triangle revolved", revolvedTriangle);
        addStandard("parivrtta trikonasana", revolvedTriangle);
        addStandard("tam giác vặn", revolvedTriangle);

        // 14. Eagle Pose (Garudasana - Tư thế đại bàng)
        String eagle = """
            - Chân: Một chân quấn quanh chân kia, đầu gối hơi trùng.
            - Tay: Hai tay xoắn vào nhau, khuỷu tay nâng ngang vai.
            - Lưng: Thẳng đứng.
            - Hông: Hạ thấp trọng tâm.
            """;
        addStandard("eagle pose", eagle);
        addStandard("garudasana", eagle);
        addStandard("đại bàng", eagle);

        // 15. Headstand (Sirsasana - Trồng chuối bằng đầu)
        String headstand = """
            - Cơ thể: Tạo thành đường thẳng đứng vuông góc với sàn.
            - Trọng lực: Dồn vào cẳng tay và vai (không dồn hết vào cổ).
            - Chân: Duỗi thẳng lên trần.
            """;
        addStandard("headstand", headstand);
        addStandard("sirsasana", headstand);
        addStandard("trồng chuối", headstand);

        // 16. Shoulder Stand (Sarvangasana - Đứng trên vai)
        String shoulderStand = """
            - Cơ thể: Thẳng đứng từ vai đến chân.
            - Cằm: Thu về hõm cổ (khóa cằm).
            - Tay: Đỡ lưng dưới để hỗ trợ.
            - Trọng lực: Dồn vào vai và bắp tay (không dồn vào cổ).
            """;
        addStandard("shoulder stand", shoulderStand);
        addStandard("sarvangasana", shoulderStand);
        addStandard("đứng trên vai", shoulderStand);

        // 17. Wheel Pose (Urdhva Dhanurasana - Tư thế bánh xe)
        String wheel = """
            - Tay & Chân: Chống sàn đẩy cơ thể lên.
            - Lưng: Uốn cong hình vòng cung.
            - Tay: Cố gắng duỗi thẳng (~180°).
            - Ngực: Mở rộng tối đa.
            """;
        addStandard("wheel pose", wheel);
        addStandard("urdhva dhanurasana", wheel);
        addStandard("bánh xe", wheel);

        // 18. Lotus Pose (Padmasana - Tư thế hoa sen)
        String lotus = """
            - Chân: Hai bàn chân đặt chéo lên đùi đối diện, lòng bàn chân ngửa.
            - Lưng: Thẳng đứng.
            - Vai: Thả lỏng.
            - Đầu gối: Cố gắng chạm sàn.
            """;
        addStandard("lotus pose", lotus);
        addStandard("padmasana", lotus);
        addStandard("hoa sen", lotus);

        // 19. Half Moon Pose (Ardha Chandrasana - Nửa vầng trăng)
        String halfMoon = """
            - Chân trụ: Thẳng (~180°).
            - Chân trên: Nâng cao song song với sàn (~90° so với chân trụ).
            - Tay: Một tay chống sàn, tay kia vươn lên trần.
            - Thân: Mở rộng sang bên.
            """;
        addStandard("half moon pose", halfMoon);
        addStandard("ardha chandrasana", halfMoon);
        addStandard("nửa vầng trăng", halfMoon);

        // 20. Low Lunge (Anjaneyasana - Trăng lưỡi liềm thấp)
        String lowLunge = """
            - Chân trước: Gập gối vuông góc (~90°).
            - Chân sau: Hạ gối chạm sàn, duỗi mũi chân.
            - Hông: Ép xuống thấp.
            - Tay: Vươn cao qua đầu, ngực mở.
            """;
        addStandard("low lunge", lowLunge);
        addStandard("anjaneyasana", lowLunge);
        addStandard("trăng lưỡi liềm", lowLunge);

        // 21. High Lunge (Utthita Ashwa Sanchalanasana - Tấn cao)
        String highLunge = """
            - Chân trước: Gập gối vuông góc (~90°).
            - Chân sau: Duỗi thẳng (~180°), gót chân nâng khỏi sàn.
            - Hông: Hướng thẳng về trước.
            - Tay: Vươn cao song song.
            """;
        addStandard("high lunge", highLunge);
        addStandard("utthita ashwa sanchalanasana", highLunge);
        addStandard("tấn cao", highLunge);

        // 22. Garland Pose (Malasana - Tư thế vòng hoa/ngồi xổm)
        String garland = """
            - Chân: Mở rộng hơn hông, ngồi xổm thấp.
            - Gót chân: Chạm sàn (nếu có thể).
            - Lưng: Giữ thẳng.
            - Tay: Chắp trước ngực, khuỷu tay đẩy nhẹ đầu gối ra ngoài.
            """;
        addStandard("garland pose", garland);
        addStandard("malasana", garland);
        addStandard("vòng hoa", garland);

        // 23. Cow Face Pose (Gomukhasana - Mặt bò)
        String cowFace = """
            - Chân: Ngồi xếp chồng hai đầu gối lên nhau.
            - Tay: Một tay vòng qua vai, một tay vòng sau lưng, nắm lấy nhau.
            - Lưng: Thẳng đứng.
            """;
        addStandard("cow face pose", cowFace);
        addStandard("gomukhasana", cowFace);
        addStandard("mặt bò", cowFace);

        // 24. Hero Pose (Virasana - Anh hùng)
        String hero = """
            - Chân: Quỳ gối, hai bàn chân mở rộng sang hai bên hông.
            - Mông: Ngồi lọt giữa hai gót chân (chạm sàn).
            - Lưng: Thẳng đứng.
            - Đầu gối: Khép sát nhau.
            """;
        addStandard("hero pose", hero);
        addStandard("virasana", hero);
        addStandard("anh hùng", hero);

        // 25. Corpse Pose (Savasana - Xác chết)
        String corpse = """
            - Cơ thể: Nằm ngửa, thả lỏng hoàn toàn trên sàn.
            - Chân: Mở rộng bằng vai, ngón chân đổ sang hai bên.
            - Tay: Buông xuôi, lòng bàn tay ngửa, cách thân 45°.
            """;
        addStandard("corpse pose", corpse);
        addStandard("savasana", corpse);
        addStandard("xác chết", corpse);

        // 26. Bridge Pose (Setu Bandhasana - Cây cầu)
        String bridge = """
            - Vai & Đầu: Áp sát sàn.
            - Hông: Nâng cao khỏi sàn.
            - Chân: Bàn chân song song, đầu gối thẳng hàng mắt cá (~90°).
            - Ngực: Nâng về phía cằm.
            """;
        addStandard("bridge pose", bridge);
        addStandard("setu bandhasana", bridge);
        addStandard("cây cầu", bridge);

        // 27. Childs Pose (Balasana - Em bé)
        String childsPose = """
            - Mông: Ngồi trên gót chân.
            - Trán: Chạm sàn.
            - Ngực: Thả lỏng trên đùi.
            - Tay: Duỗi thẳng về trước hoặc buông xuôi ra sau.
            """;
        addStandard("childs pose", childsPose);
        addStandard("balasana", childsPose);
        addStandard("em bé", childsPose);

        // 28. Cat-Cow Pose (Marjaryasana-Bitilasana - Mèo Bò)
        String catCow = """
            - Tư thế bò (Cow): Lưng võng xuống, ngực mở, đầu ngẩng lên.
            - Tư thế mèo (Cat): Lưng cong lên trần, cằm thu về ngực.
            - Tay & Đùi: Vuông góc với sàn (~90°).
            """;
        addStandard("cat-cow pose", catCow);
        addStandard("marjaryasana", catCow);
        addStandard("mèo bò", catCow);

        // 29. Seated Forward Bend (Paschimottanasana - Ngồi gập mình)
        String seatedForward = """
            - Chân: Duỗi thẳng trên sàn (~180°).
            - Lưng: Duỗi dài, gập người về phía chân.
            - Tay: Nắm lấy bàn chân hoặc ống chân.
            - Bụng: Áp sát đùi (nếu có thể).
            """;
        addStandard("seated forward bend", seatedForward);
        addStandard("paschimottanasana", seatedForward);
        addStandard("ngồi gập mình", seatedForward);

        // 30. Boat Pose (Navasana - Con thuyền)
        String boat = """
            - Cơ thể: Tạo hình chữ V.
            - Lưng: Thẳng, ngả ra sau.
            - Chân: Nâng cao, thẳng (~180°) hoặc gập gối (biến thể).
            - Tay: Duỗi thẳng song song với sàn.
            """;
        addStandard("boat pose", boat);
        addStandard("navasana", boat);
        addStandard("con thuyền", boat);

        // 31. Side Plank (Vasisthasana - Tấm ván nghiêng)
        String sidePlank = """
            - Cơ thể: Đường thẳng nghiêng từ đầu đến chân.
            - Tay trụ: Thẳng (~180°), vai thẳng hàng cổ tay.
            - Chân: Xếp chồng lên nhau hoặc chân trên đặt trước.
            - Hông: Đẩy cao, không bị sệ xuống.
            """;
        addStandard("side plank", sidePlank);
        addStandard("vasisthasana", sidePlank);
        addStandard("tấm ván nghiêng", sidePlank);

        // 32. Chair Pose (Utkatasana - Cái ghế)
        String chair = """
            - Đầu gối: Gập lại như đang ngồi ghế, không vượt quá mũi chân.
            - Lưng: Giữ thẳng, trọng lượng dồn vào gót chân.
            - Tay: Vươn cao song song qua đầu.
            """;
        addStandard("chair pose", chair);
        addStandard("utkatasana", chair);
        addStandard("cái ghế", chair);

        // --- Các tư thế cũ đã có ---
        // Warrior II (Chiến binh 2)
        String warriorII = """
            - Đầu gối chân trước (Front Knee): ~90° (vuông góc với sàn).
            - Chân sau (Back Leg): ~180° (duỗi thẳng).
            - Hai tay (Arms): ~180° (dang ngang bằng vai, song song với sàn).
            - Lưng (Spine): ~180° (thẳng đứng, không đổ về trước).
            """;
        addStandard("warrior ii", warriorII);
        addStandard("virabhadrasana ii", warriorII);
        addStandard("chiến binh 2", warriorII);

        // Warrior I (Chiến binh 1)
        String warriorI = """
            - Đầu gối chân trước: ~90°.
            - Chân sau: ~180° (thẳng), bàn chân xoay 45°.
            - Hai tay: Vươn cao song song qua đầu.
            - Hông: Hướng thẳng về phía trước.
            """;
        addStandard("warrior i", warriorI);
        addStandard("virabhadrasana i", warriorI);
        addStandard("chiến binh 1", warriorI);

        // Tree Pose (Cái cây)
        String treePose = """
            - Chân trụ (Standing Leg): ~180° (thẳng, vững chãi).
            - Chân co (Bent Leg): Bàn chân đặt lên đùi trong (tránh đặt lên đầu gối).
            - Đầu gối chân co: Hướng sang ngang.
            - Lưng: Thẳng đứng.
            """;
        addStandard("tree pose", treePose);
        addStandard("vrksasana", treePose);
        addStandard("cái cây", treePose);

        // Downward Facing Dog (Chó úp mặt)
        String downDog = """
            - Cơ thể tạo thành hình chữ V ngược.
            - Chân: ~180° (cố gắng thẳng, gót chân chạm sàn nếu có thể).
            - Tay: ~180° (thẳng, đẩy sàn ra xa).
            - Lưng: Thẳng, kéo dài cột sống.
            """;
        addStandard("downward facing dog", downDog);
        addStandard("adho mukha svanasana", downDog);
        addStandard("chó úp mặt", downDog);

        // Cobra (Rắn hổ mang)
        String cobra = """
            - Chân: ~180° (duỗi thẳng, mu bàn chân áp sàn).
            - Khuỷu tay: Hơi trùng nhẹ, ép sát vào thân người.
            - Ngực: Mở rộng, nâng cao.
            - Vai: Hạ thấp, xa tai.
            """;
        addStandard("cobra", cobra);
        addStandard("bhujangasana", cobra);
        addStandard("rắn hổ mang", cobra);

        // Plank (Tấm ván)
        String plank = """
            - Cơ thể: Một đường thẳng từ đầu đến gót chân.
            - Tay: ~180° (thẳng, vuông góc với sàn).
            - Hông: Không võng xuống, không nhô cao.
            """;
        addStandard("plank", plank);
        addStandard("kumbhakasana", plank);
        addStandard("tấm ván", plank);
        
        // Triangle (Tam giác)
        String triangle = """
            - Hai chân: ~180° (thẳng).
            - Hai tay: ~180° (dang rộng, một tay chạm sàn/chân, một tay hướng lên trần).
            - Lưng: Thẳng, nghiêng sang một bên.
            """;
        addStandard("triangle", triangle);
        addStandard("trikonasana", triangle);
        addStandard("tam giác", triangle);
    }

    private void addStandard(String key, String value) {
        standardAngles.put(key.toLowerCase(), value);
    }

    /**
     * Lấy thông tin góc chuẩn dựa trên tên tư thế (tìm kiếm tương đối)
     */
    public String getStandardAngles(String poseName) {
        if (poseName == null) return null;
        String lowerName = poseName.toLowerCase();
        
        // Tìm kiếm chính xác hoặc chứa trong tên
        return standardAngles.entrySet().stream()
                .filter(entry -> lowerName.contains(entry.getKey()) || entry.getKey().contains(lowerName))
                .map(Map.Entry::getValue)
                .findFirst()
                .orElse(null);
    }
}
