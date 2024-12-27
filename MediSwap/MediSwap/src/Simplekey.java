import java.awt.*;
import java.awt.event.*;
public class Simplekey extends Frame implements KeyListener {
	String msg = "";
	int X = 50, Y = 50; 
	Simplekey(String title){
		super(title);
		addKeyListener(this);
		addWindowListener(new MyWAdapter());
		setSize(400,400);
		setVisible(true);
	}
	public void keyPressed(KeyEvent ke) {
		msg="Key Down";
		repaint();
	}
	public void keyReleased(KeyEvent ke) {
		msg="Key Up";
		repaint();

	}
	public void keyTyped(KeyEvent ke) {
		msg="key typed";
		msg=msg+"  "+ke.getKeyChar();
		repaint();

	}


	public void paint(Graphics g) {
		g.drawString (msg,X,Y);

	}
	public static void main(String a[]){
		Simplekey sk= new Simplekey("KeyBoard handling");

	}

}

class MyWAdapter extends WindowAdapter{
	public void windowClosing(WindowEvent we){
		System.exit(0);

    }

}