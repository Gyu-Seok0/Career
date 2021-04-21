package C;

public class AccessObj {
    // 생성자
    int p = 1;
    int p2 = 2;
    protected int p3 = 3;

    // 디폴트 생성자 함수
    public AccessObj(){};

    // 일반적인 생성자 함수

    public AccessObj(int p, int p2, int p3) {
        this.p = p;
        this.p2 = p2;
        this.p3 = p3;
    }

}
