#if !defined(ROBOT_NAME_H)
#define ROBOT_NAME_H

#include <unordered_set>
#include <string>
#include <random>

namespace robot_name {

class robot {
public:
    robot() { reset(); };
    void reset();
    inline const std::string& name() const { return m_name; }

private:
    std::string m_name;

    inline static std::mt19937 s_generator;
    inline static std::unordered_set<std::string> s_past_names{};
    
    int getRandomNumber(int low, int high);
    char getRandomNumberChar();
    char getRandomChar();
    std::string getName();

};

}  // namespace robot_name

#endif // ROBOT_NAME_H