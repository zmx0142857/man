// sudo apt install libsfml-dev
// g++ test.cpp -o test -lsfml-graphics -lsfml-window -lsfml-system
#include <SFML/Graphics.hpp>
#include <iostream>

void on(const sf::Event &event)
{
	if (event.type == sf::Event::MouseButtonPressed) {
		if (event.mouseButton.button == sf::Mouse::Right) {
			std::cout << "right click at (" << event.mouseButton.x
				<< ", " << event.mouseButton.y << ')' << std::endl;
		}
	}
	if (event.type == sf::Event::MouseButtonReleased) {
		std::cout << "release" << std::endl;
	}
	if (sf::Keyboard::isKeyPressed(sf::Keyboard::Up)) {
		std::cout << "up" << std::endl;
	}
}

int main()
{
	// 创建窗口
	sf::RenderWindow window(sf::VideoMode(200, 200), "SFML works!");

	// 一个绿色的圆
	sf::CircleShape shape(100.f);
	shape.setFillColor(sf::Color::Green);

	// 消息循环
	while (window.isOpen()) {
		sf::Event event;
		while (window.pollEvent(event)) {
			if (event.type == sf::Event::Closed)
				window.close();
			on(event);
		}
		window.clear();
		window.draw(shape);
		window.display();
	}
	return 0;
}
