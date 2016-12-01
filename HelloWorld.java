public class HelloWorld {
    public static void main(String[] args) {
      float lat = Float.parseFloat(args[1]);
      float lon = Float.parseFloat(args[2]);

      Location myloc= new Location();
      myloc.setLatitude(lat);
      myloc.setLongitude(lon);

      Time mytime = new Time();
    }

}

