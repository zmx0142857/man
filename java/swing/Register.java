import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Register extends JFrame {
	private static final String[] specilalities = {"计算机科学与技术", "信息工程", "生物医学工程", "安全工程", "艺术设计学"};

	public Register() {
		JLabel nameLabel = new JLabel("姓名");
		nameLabel.setBounds(30, 10, 50, 25);

		JTextField nameField = new JTextField();
		nameField.setBounds(80, 10, 120, 20);
		nameField.setBackground(Color.pink);
		nameField.setBorder(BorderFactory.createLineBorder(Color.lightGray));
		nameField.addKeyListener(new KeyAdapter() {
			public void keyPressed(KeyEvent e) {}
		});

		JLabel specialityLabel = new JLabel("专业");
		specialityLabel.setBounds(30, 40, 50, 25);

		JList specialityList = new JList<String>(specilalities);
		specialityList.setBounds(80, 40, 120, 85);
		specialityList.setBorder(BorderFactory.createLineBorder(Color.blue));

		JLabel genderLabel = new JLabel("性别");
		genderLabel.setBounds(30, 130, 50, 25);

		ButtonGroup buttonGroup = new ButtonGroup();
		JRadioButton male = new JRadioButton("男");
		JRadioButton female = new JRadioButton("女");
		male.setBounds(80, 130, 60, 25);
		female.setBounds(140, 130, 60, 25);
		buttonGroup.add(male);
		buttonGroup.add(female);

		JLabel hobbyLabel = new JLabel("爱好");
		hobbyLabel.setBounds(30, 160, 50, 25);
		JCheckBox hobby1 = new JCheckBox("音乐");
		JCheckBox hobby2 = new JCheckBox("篮球");
		JCheckBox hobby3 = new JCheckBox("高尔夫");
		JCheckBox hobby4 = new JCheckBox("动漫");
		hobby1.setBounds(80, 160, 60, 25);
		hobby2.setBounds(140, 160, 60, 25);
		hobby3.setBounds(200, 160, 65, 25);
		hobby4.setBounds(265, 160, 60, 25);

		JLabel descriptionLabel = new JLabel("简介");
		descriptionLabel.setBounds(30, 250, 90, 25);
		JTextArea descriptionText = new JTextArea();
		descriptionText.setBounds(30, 270, 260, 100);
		descriptionText.setBorder(BorderFactory.createLineBorder(Color.black));

		JButton okButton = new JButton("确定");
		okButton.setBounds(50, 190, 60, 25);
		okButton.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent event) {
				StringBuffer sb = new StringBuffer();
				sb.append(nameLabel.getText()).append(": ")
				  .append(nameField.getText()).append("\n");
				sb.append(specialityLabel.getText()).append(": ");
				int index = specialityList.getSelectedIndex();
				if (index >= 0)
					sb.append(specilalities[index]);
				sb.append("\n").append(genderLabel.getText()).append(": ");
				if (male.isSelected())
					sb.append(male.getText());
				else if (female.isSelected())
					sb.append(female.getText());
				sb.append("\n").append(hobbyLabel.getText()).append(": ");
				if (hobby1.isSelected())
					sb.append(hobby1.getText()).append(" ");
				if (hobby2.isSelected())
					sb.append(hobby2.getText()).append(" ");
				if (hobby3.isSelected())
					sb.append(hobby3.getText()).append(" ");
				if (hobby4.isSelected())
					sb.append(hobby4.getText()).append(" ");
				descriptionText.setText(sb.toString());
			}
		});

		JButton clearButton = new JButton("清空");
		clearButton.setBounds(120, 190, 60, 25);
		clearButton.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent event) {
				nameField.setText("");
				specialityList.clearSelection();
				hobby1.setSelected(false);
				hobby2.setSelected(false);
				hobby3.setSelected(false);
				hobby4.setSelected(false);
				descriptionText.setText("");
			}
		});

		setTitle("注册");
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		getContentPane().setLayout(null); // 手动布局
		setLocation(100, 100);
		setSize(340, 420);

		add(nameLabel);
		add(nameField);
		add(specialityLabel);
		add(specialityList);
		add(genderLabel);
		add(male);
		add(female);
		add(hobbyLabel);
		add(hobby1);
		add(hobby2);
		add(hobby3);
		add(hobby4);
		add(descriptionLabel);
		add(descriptionText);
		add(okButton);
		add(clearButton);
		setVisible(true);
	}

	public static void main (String[] args) {
		Register reg = new Register();
	}
}
