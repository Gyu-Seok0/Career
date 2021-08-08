public class SoliderTest {
    public static void main(String[] args) {
        Solider exam = new Solider();
        exam.setAge(10);
        System.out.println(exam.getAge());

        Solider exam2 = new Solider("조류퇴치",24);
        System.out.println(exam2.getMission());
    }
}
