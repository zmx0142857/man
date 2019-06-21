import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Register extends JFrame {
	private static final String[] specilalities = {"计算机科学与技术", "信息工程", "生物医学工程", "安全工程", "艺术设计学"};
	private static final String[] hobbies = {"唱", "跳", "rap", "篮球"};

	public Register() {
		setTitle("注册");
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		getContentPane().setLayout(null); // 手动布局
		setLocation(100, 100);
		setSize(360, 360);

		JLabel nameLabel = new JLabel("姓名");
		nameLabel.setBounds(30, 10, 50, 25);
		add(nameLabel);

		JTextField nameField = new JTextField();
		nameField.setBounds(80, 10, 120, 20);
		nameField.setBackground(Color.pink);
		nameField.setBorder(BorderFactory.createLineBorder(Color.lightGray));
		nameField.addKeyListener(new KeyAdapter() {
			public void keyPressed(KeyEvent e) {}
		});
		add(nameField);

		JLabel specialityLabel = new JLabel("专业");
		specialityLabel.setBounds(30, 40, 50, 25);
		add(specialityLabel);

		//JList specialityList = new JList<String>(specilalities);
		JComboBox specialityList = new JComboBox<String>(specilalities);
		specialityList.setBounds(80, 40, 120, 20);
		specialityList.setBorder(BorderFactory.createLineBorder(Color.blue));
		/*
		specialityList.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent e) {
			}
		});
		*/
		add(specialityList);

		JLabel genderLabel = new JLabel("性别");
		genderLabel.setBounds(30, 70, 50, 25);
		add(genderLabel);

		ButtonGroup buttonGroup = new ButtonGroup();
		JRadioButton male = new JRadioButton("男");
		JRadioButton female = new JRadioButton("女");
		male.setBounds(80, 70, 60, 25);
		female.setBounds(140, 70, 60, 25);
		buttonGroup.add(male);
		buttonGroup.add(female);
		// add(buttonGroup) leads to build error!
		add(male);
		add(female);

		JLabel hobbyLabel = new JLabel("爱好");
		hobbyLabel.setBounds(30, 100, 50, 25);
		add(hobbyLabel);

		JCheckBox[] hobbyCheckBox = new JCheckBox[hobbies.length];
		for (int i = 0; i < hobbies.length; ++i) {
			hobbyCheckBox[i] = new JCheckBox(hobbies[i]);
			hobbyCheckBox[i].setBounds(80 + 60*i, 100, 60, 25);
			add(hobbyCheckBox[i]);
		}

		JLabel descriptionLabel = new JLabel("简介");
		descriptionLabel.setBounds(30, 170, 90, 25);
		add(descriptionLabel);

		JTextArea descriptionText = new JTextArea();
		descriptionText.setBounds(30, 200, 260, 100);
		descriptionText.setBorder(BorderFactory.createLineBorder(Color.black));
		add(descriptionText);

		JButton okButton = new JButton("确定");
		okButton.setBounds(80, 140, 60, 25);
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
				for (int i = 0; i < hobbies.length; ++i) {
					if (hobbyCheckBox[i].isSelected())
						sb.append(hobbyCheckBox[i].getText()).append(" ");
				}
				descriptionText.setText(sb.toString());
			}
		});
		add(okButton);

		JButton clearButton = new JButton("清空");
		clearButton.setBounds(180, 140, 60, 25);
		clearButton.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent event) {
				nameField.setText("");
				//specialityList.clearSelection();
				for (int i = 0; i < hobbies.length; ++i)
					hobbyCheckBox[i].setSelected(false);
				descriptionText.setText("");
			}
		});
		add(clearButton);

		setVisible(true);
	}

	public static void main (String[] args) {
		Register reg = new Register();
	}
}
