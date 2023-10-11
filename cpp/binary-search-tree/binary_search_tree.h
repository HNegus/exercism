#if !defined(BINARY_SEARCH_TREE_H)
#define BINARY_SEARCH_TREE_H

#include <memory>
#include <stack>

namespace binary_search_tree {

template<typename T>
class binary_tree {
    using tree_type = binary_tree<T>;

public:


    binary_tree() = default;
    ~binary_tree() = default;
    binary_tree(binary_tree&&) = delete;
    binary_tree(const binary_tree&) = delete;
    binary_tree& operator=(const binary_tree&) = delete;

    binary_tree(T value)
    {
        m_value = value;
    }
    T data() const
    {
        return m_value;
    }
    void insert(T value)
    {
        if (value <= m_value)
        {
            if (m_left == nullptr) {
                m_left = std::make_unique<tree_type>(value);
            } else {
               m_left->insert(value);
            }
        } else {
            if (m_right == nullptr) {
                m_right = std::make_unique<tree_type>(value);
            } else {
                m_right->insert(value);
            }
        }
    }
    const std::unique_ptr<tree_type>& left() const
    {
        return m_left;
    }
    const std::unique_ptr<tree_type>& right() const
    {
        return m_right;
    }


private:
    struct Iterator {
        tree_type* ptr = nullptr;

        Iterator() = default;
        Iterator(binary_tree& tree) : ptr{&tree} {
            goLeft();
            ptr = stack.top();
        };
        void goLeft() 
        {
            binary_tree *p = ptr;
            while (p) {
                stack.push(p);
                p = p->left().get();
            }
        }
        bool operator==(const Iterator& other)
        {
            return ptr == other.ptr;
        }
        bool operator!=(const Iterator& other)
        {
            return !(*this == other);
        }
        Iterator& operator++() {
            if (ptr == nullptr) {
                return *this;
            }
            if (!stack.empty()) {
                stack.pop();
            }
            if (ptr->right()) {
                ptr = ptr->right().get();
                goLeft();
            }
            if (!stack.empty()) {
                ptr = stack.top();
            } else {
                ptr = nullptr;
            }
            return *this;
        }
        Iterator operator++(int)
        {
            Iterator next = *this;
            ++(*this);
            return next;
        }
        T& operator*()
        {
            return ptr->m_value;
        }
        private:
            std::stack<tree_type*> stack{};
    };
public:
    Iterator begin()
    {
        return Iterator(*this);
    }
    Iterator end()
    {
        return Iterator(); 
    }

private:
    std::unique_ptr<tree_type> m_left{nullptr}, m_right{nullptr};
    T m_value{};

};

}  // namespace binary_search_tree

#endif // BINARY_SEARCH_TREE_H
