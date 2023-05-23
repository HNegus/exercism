#if !defined(BANK_ACCOUNT_H)
#define BANK_ACCOUNT_H

#include <mutex>

namespace Bankaccount {
class Bankaccount
{

public:
    Bankaccount() = default;
    ~Bankaccount() = default;

    void open();
    void close();
    void deposit(int amount);
    void withdraw(int amount);
    int balance();

private:

    int m_balance = 0;
    bool m_opened = false;
    std::mutex m_mutex;

    void throwIfClosed();

}; // class Bankaccount

}  // namespace Bankaccount

#endif  // BANK_ACCOUNT_H