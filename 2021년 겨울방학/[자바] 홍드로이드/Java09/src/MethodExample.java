public class MethodExample {


    public static void main(String[] args) {
        String a = "Hello";
        String b = "Hongdroid";
        String result = "";
//      Strcombine(a,b);
        MethodExample temp = new MethodExample();
        result = temp.StrHongdroid("hello55","gyuseok");
        System.out.println(result);
    }

    // 메소드 만든 것
    // 메소드를 만드는 이유
    // 1. 유지보수를 위해
    // 2. 가독성이 좋아지니까
    // 3. 캡슐화 (여러 곳에서 중복된 코드를 작성할 필요가 없어짐)

    public void Strcombine (String a, String b){ // void는 실행형 method
        System.out.println(a +b);
    }

    public String StrHongdroid(String temp1, String temp2){
        return temp1 + temp2;
    }
}
