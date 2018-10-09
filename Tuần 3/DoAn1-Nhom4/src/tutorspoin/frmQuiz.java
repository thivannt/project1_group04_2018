package tutorspoin;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.swing.ButtonGroup;
import javax.swing.DefaultCellEditor;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JRadioButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JComboBox;
import java.awt.Color;

public class frmQuiz extends JFrame implements ActionListener {

	ButtonGroup bg=new ButtonGroup();
	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					frmQuiz frame = new frmQuiz();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	JPanel NullLayout;
	JTable tbQuiz;
	JScrollPane scrollPane;
	JRadioButton rbDapAn1;
	JRadioButton rbDapAn2;
	JRadioButton rbDapAn3;
	JRadioButton rbDapAn4;
	JLabel lblQuestion;
	 JComboBox cmbSubject;
	public frmQuiz() 
	{
		//loadData();
		
		
		setTitle("Câu hỏi trắc nghiệm");
		setBounds(100, 100, 642, 488);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
		

		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		
		
		 NullLayout=new JPanel();
		NullLayout.setLayout(null);
		this.getContentPane().add(NullLayout);
		
		tbQuiz=new JTable();
		tbQuiz.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				cell_click();
			}
		});
		
		tbQuiz.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		 scrollPane = new JScrollPane(tbQuiz);
		scrollPane.setBounds(10, 160, 602, 268);
		NullLayout.add(scrollPane);
		

		 rbDapAn1 = new JRadioButton("1");
//
		rbDapAn1.setBounds(40, 79, 109, 23);
		bg.add(rbDapAn1);
	
		NullLayout.add(rbDapAn1);
		
		 rbDapAn3 = new JRadioButton("3");
		rbDapAn3.setBounds(40, 118, 109, 23);
		bg.add(rbDapAn3);
		NullLayout.add(rbDapAn3);
		
		 rbDapAn2 = new JRadioButton("2");
		rbDapAn2.setBounds(332, 79, 109, 23);
		bg.add(rbDapAn2);
		NullLayout.add(rbDapAn2);
		
		rbDapAn4 = new JRadioButton("4");
		rbDapAn4.setBounds(332, 118, 109, 23);
		bg.add(rbDapAn4);
		NullLayout.add(rbDapAn4);
		
		 lblQuestion = new JLabel("New label");
		 
		lblQuestion.setFont(new Font("Times New Roman", Font.BOLD, 15));
		lblQuestion.setBounds(49, 51, 336, 14);
		NullLayout.add(lblQuestion);
		
		cmbSubject = new JComboBox();
		cmbSubject.setForeground(Color.RED);
		cmbSubject.setFont(new Font("Times New Roman", Font.BOLD | Font.ITALIC, 15));
		cmbSubject.setBounds(445, 31, 167, 23);
		NullLayout.add(cmbSubject);
		
	
		
		
		
		isFirstTime = false;

		loadText();
	
		loadData();

		cell_click();
	
		
		
	}
	Connection conn;
	Statement stmt = null;
	public PreparedStatement pst;// Data adapter
	public static ResultSet rs=null;//Data table

	
	public void loadText()
	{
	

		myConnect cn=new myConnect();
		cn.KetNoi();
		
		try {
			rs=cn.GetData("doan1.subject");
			while(rs.next())
			{
				cmbSubject.addItem(rs.getString("nameSubject"));
			}
		} catch (SQLException e) {
			System.out.println("Loi combobox");
			e.printStackTrace();
		}
		

		
	
		
	}
	
	
	public void loadData() 
	{
	
	
		myConnect cn=new myConnect();
		cn.KetNoi();
		
		try {
			
		
			//getText();
			rs=cn.GetData("doan1.quiz");
			tbQuiz.removeAll();
			String [] arr= {"Mã quiz","Tên quiz","Đáp án 1","Đáp án 2 ","Đáp án 3","Đáp án 4","Câu trả lời đúng","Subject_idSubject"};
			DefaultTableModel model=new DefaultTableModel(arr,0);
			 while(rs.next())
			 {
			     Vector<String> vec = new Vector<String>();         
			     vec.add(rs.getString("idQuiz"));
			     vec.add(rs.getString("quiz"));
			     vec.add(rs.getString("answ1"));
			     vec.add(rs.getString("answ2"));
			     vec.add(rs.getString("answ3"));
			     vec.add(rs.getString("answ4"));
			     vec.add(rs.getString("correctAnsw"));
			    //vec.add(rs.getString("status"));
			     vec.add(rs.getString("subject_idSubject"));
			     model.addRow(vec);
			 }
		     tbQuiz.setModel(model);
		   
			}
		 catch (SQLException e) {
			System.out.println("Lỗi");
			e.printStackTrace();
		}
		

	}
	
	private boolean isFirstTime ;


	public void cell_click()
	{
		

		int r= tbQuiz.getSelectedRow();
		if(!isFirstTime)
			 r = 0;

		String question=tbQuiz.getValueAt(r, 1).toString();
		String a=tbQuiz.getValueAt(r, 2).toString();
		String b=tbQuiz.getValueAt(r, 3).toString();
		String c=tbQuiz.getValueAt(r, 4).toString();
		String d=tbQuiz.getValueAt(r, 5).toString();
		
		
		rbDapAn1.setText(a);
		rbDapAn2.setText(b);
		rbDapAn3.setText(c);
		rbDapAn4.setText(d);
		lblQuestion.setText(question);
		
		if(rbDapAn1.isSelected())
		{
			bg.clearSelection();
		}
		if(rbDapAn2.isSelected())
		{
			bg.clearSelection();
		}
		if(rbDapAn3.isSelected())
		{
			bg.clearSelection();
		}
		if(rbDapAn4.isSelected())
		{
			bg.clearSelection();
		}
		isFirstTime = true;
	}

	

	@Override
	public void actionPerformed(ActionEvent arg0) {
		
		
	}
}

