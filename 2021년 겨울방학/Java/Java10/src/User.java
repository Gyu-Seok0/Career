public class User {

    String name;
    int age;
    String hobby;

    // 클래스의 생성자
//    public User (String _name, int _age, String _hobby) {
//        this.name = _name;
//        this.age = _age;
//        this.hobby = _hobby;
//    }
    //디폴트 생성자-->게터세터 쓸꺼면 만들어야
    public  User(){};

    //일반적인 생성자
    public User(String name, int age, String hobby) {
        this.name = name;
        this.age = age;
        this.hobby = hobby;
    }
    /*getter setter */

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public static void main(String[] args) {


    }
}
