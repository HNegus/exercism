#include "bank_account.h"

#include <stdexcept>

namespace Bankaccount {

    void Bankaccount::open()
    {
        std::scoped_lock<std::mutex> lock(m_mutex);
        if (m_opened) {
            throw std::runtime_error("Account is already opened");
        }
        m_opened = true;
        m_balance = 0;
    }

    void Bankaccount::close()
    {
        std::scoped_lock<std::mutex> lock(m_mutex);
        throwIfClosed();
        m_opened = false;
    }

    void Bankaccount::deposit(int amount)
    {
        std::scoped_lock<std::mutex> lock(m_mutex);
        throwIfClosed();
        if (amount < 0) {
            throw std::runtime_error("Cannot withdraw negative amount");
        }
        m_balance += amount;
    }

    void Bankaccount::withdraw(int amount)
    {
        std::scoped_lock<std::mutex> lock(m_mutex);
        throwIfClosed();
        if (amount < 0) {
            throw std::runtime_error("Cannot withdraw negative amount");
        }
        if (m_balance < amount) {
            throw std::runtime_error("Cannot withdraw more than balance");
        }
        m_balance -= amount;
    }

    int Bankaccount::balance()
    {
        std::scoped_lock<std::mutex> lock(m_mutex);
        throwIfClosed();
        return m_balance;
    }

    void Bankaccount::throwIfClosed()
    {
        if (!m_opened) {
            throw std::runtime_error("Account is closed");
        }
    }
}