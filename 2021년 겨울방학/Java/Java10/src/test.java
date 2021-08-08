public class test {
    public static void main(String[] args) {
        User user2 = new User("이규석",26,"코딩");
        User user = new User(); // 이번에는 값을 안넣을꺼야!
        user.setName("홍드로이드");
        System.out.println(user.getName());
        user2.setName("ㅇㅇㅈ");
        System.out.println(user2.getName());
    }
}
