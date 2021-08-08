
public class MethodExample {
    public static void main(String[] args) {
        String a = "hello";
        String b = "  Gyu Seok";

//       System.out.println(a+b);
        MethodExample test = new MethodExample(); // 자기자신을 선언함
        test.Strcombine("lee","  sdf");

        test.Strcombine("Guuseok","lee");
        String result = test.StrHongdroid("알파","오메가");
        System.out.println(result);

    }
    // 메소드를 만든 것
    // 메소드를 만드는 이유
    // 1. 유지보수를 위해서
    // 2. 가독성이 좋아지니까
    // 3. 캡슐화 (여러 곳에서 중복된 코드를 작성할 필요가 없어짐)

    public void Strcombine(String x, String y){
        String result = x + y;
        System.out.println(result);
    }

    public String StrHongdroid(String A, String B){
        return B+A;
    }
}
