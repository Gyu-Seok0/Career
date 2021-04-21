package Archer;

public class Archer {
    String name;
    String power;

    // 생성자 함수
    public Archer(String name, String power) {
        this.name = name;
        this.power = power;
    }

    public boolean equals(Object obj){
        Archer temp = (Archer) obj;
        if (name == temp.name && power == temp.power){
            return true;
        }
        else{
            return false;
        }
     }

    //



}
