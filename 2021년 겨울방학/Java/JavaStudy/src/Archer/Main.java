package Archer;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        Archer archer1 = new Archer("궁수1","상");
        Archer archer2 = new Archer("궁수1","");
        //System.out.println(archer1 == archer2);
        System.out.println(archer1 == archer2);
        System.out.println(archer1.equals(archer2));
        Scanner sc = new Scanner(System.in);

        int temp = sc.nextInt();
        System.out.println(temp);

        String temp2[] = new String[3];
        for (int i = 0; i < temp2.length; i++){
            temp2[i] = sc.nextLine();
        }

        System.out.println(temp2[2]);

    }
}
