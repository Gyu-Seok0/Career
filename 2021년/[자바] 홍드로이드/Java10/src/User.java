public class User {

    String name;
    int age;
    String hobby;
//
//    // 클래스의 생성자
//    public User (String _name, int _age, String _hobby) {
//        this.name = _name;
//        this.age = _age;
//        this.hobby = _hobby;
//    }
    public User(){}

    public User(String name, int age, String hobby) {
        this.name = name;
        this.age = age;
        this.hobby = hobby;
    }

    public User(String name) {
        this.name = name;
    }

    // * 게터 세터 * //
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
        User man = new User("Gyuseok",26,"English");
        System.out.println(man.name );
        System.out.println(man.age);
        System.out.println(man.hobby);
    }



}
