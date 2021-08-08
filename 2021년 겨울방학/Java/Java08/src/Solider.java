public class Solider {
    // 생성자
    private String mission;
    private int age;

    // 디폴트 생성자 함수
    public Solider (){};

    public Solider(String mission, int age) {
        this.mission = mission;
        this.age = age;
    }

    public String getMission() {
        return mission;
    }

    public void setMission(String mission) {
        this.mission = mission;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
