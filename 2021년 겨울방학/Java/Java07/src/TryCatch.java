public class TryCatch {
    public static void main(String[] args) {
        int arr[] = new int[10];

        for (int i =0; i < arr.length; i++){
            arr[i] = i+1;
        }

        try
        {
            arr[10] = 9;
        }

        catch (Exception e)
        {
            e.printStackTrace();
            System.out.println(e);
            System.exit(0);

        }
        System.out.println("프로그램 종료");
    }
}
