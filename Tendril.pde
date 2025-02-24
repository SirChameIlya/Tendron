public class Tendril
{
  public final static int SEG_LENGTH = 4; //length of each segment in the tendril
  private int myNumSegments, myX, myY;
  private double myAngle;

  /**
   Class constructor
   len is how many segments in this tendril (each a fixed length, 4 is a good start)
   theta is tendril starting angle in radians
   x, y  is the starting (x,y) coordinate
   */
  public Tendril(int len, double theta, int x, int y)
  {
    myNumSegments = len;
    myAngle = theta;
    myX = x;
    myY = y;
  }
  public void show()
  {
    if (myNumSegments == 44) {
      strokeWeight(3);
      stroke(160, 210, 110);
    } else if (myNumSegments == 24) {
      strokeWeight(2);
      stroke(80, 150, 220);
    } else {
      strokeWeight(1);
      stroke(230, 90, 50);
    }
    double startX = myX;
    double startY = myY;
    for (int i = 0; i < myNumSegments; i++) {
      myAngle += 0.4 * Math.random() - 0.2;
      double endX = startX + Math.cos(myAngle)*SEG_LENGTH;
      double endY = startY + Math.sin(myAngle)*SEG_LENGTH;
      line((float)startX, (float)startY, (float)endX, (float)endY);
      startX = endX;
      startY = endY;
    }
    if (myNumSegments >= 3) {
      new Cluster(myNumSegments-20, (int)startX, (int)startY);
    } else {
     fill(230, 90, 50);
     ellipse((int)startX, (int)startY, 4, 4);
    }
  }
}
