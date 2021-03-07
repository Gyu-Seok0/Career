public class Main {

    public static void main(String[] args) {
     //   User user = new User("ABC",10,"reading a book");
        User user = new User();
        User user2 = new User("string 1개짜리 생성자");
        user.setName("getsette sucess");
        user.setAge(10);

        //System.out.println(user.getName());
        System.out.println(user.getAge());
//        System.out.println(user.age);
//        System.out.println(user.hobby);

    }
}
