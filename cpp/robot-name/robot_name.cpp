#include "robot_name.h"

namespace robot_name {

int robot::getRandomNumber(int low, int high)
{
    std::uniform_int_distribution<> distribution(low, high);
    return distribution(s_generator);
}

char robot::getRandomNumberChar()
{
    const int ascii_low = static_cast<int>('0');
    const int ascii_high = static_cast<int>('9');
    return static_cast<char>(getRandomNumber(ascii_low, ascii_high));
}

char robot::getRandomChar()
{
    const int ascii_low = static_cast<int>('A');
    const int ascii_high = static_cast<int>('Z');
    return static_cast<char>(getRandomNumber(ascii_low, ascii_high));
}

std::string robot::getName()
{
    std::string name;
    for (int i = 0; i < 2; i++) {
        name += getRandomChar();
    }
    for (int i = 0; i < 3; i++) {
        name += getRandomNumberChar();
    }
    return name;
}

void robot::reset()
{
    std::string new_name = getName();
    while (s_past_names.find(new_name) != s_past_names.end()) {
        new_name = getName();
    }
    s_past_names.insert(new_name);
    m_name = new_name;
}

}  // namespace robot_name
