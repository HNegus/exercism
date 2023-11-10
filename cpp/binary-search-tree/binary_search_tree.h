#if !defined(BINARY_SEARCH_TREE_H)
#define BINARY_SEARCH_TREE_H

#include <memory>
#include <stack>

namespace binary_search_tree {

template<typename T>
class binary_tree {
public:


    explicit binary_tree() = default;
    ~binary_tree() = default;
 
    explicit binary_tree(binary_tree&&) = default;
    binary_tree& operator=(binary_tree&&) = default;

    binary_tree(const binary_tree&) = delete;
    binary_tree& operator=(const binary_tree&) = delete;

    binary_tree(T value) : m_value{std::move(value)} {}

    const T& data() const
    {
        return m_value;
    }

    template<typename U>
    void insert(U&& value)
    {
        static_assert(std::is_same_v<T, std::remove_cv_t<std::remove_reference_t<U>>>, "Inserted type must match stored type");
        binary_tree* current = this;
        while (true) {
            auto& branch = value <= current->m_value ? current->m_left : current->m_right;
            if (!branch) {
                branch = std::make_unique<binary_tree>(std::forward<U>(value));
                break;
            }
            current = branch.get();
        }
    }
    const std::unique_ptr<binary_tree>& left() const
    {
        return m_left;
    }
    const std::unique_ptr<binary_tree>& right() const
    {
        return m_right;
    }


private:
    struct Iterator {

        using iterator_category = std::input_iterator_tag;
        using value_type        = T;
        using difference_type   = T;
        using pointer           = T*;
        using reference         = T&;

        explicit Iterator() = default;
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
        bool operator==(const Iterator& other) const
        {
            return ptr == other.ptr;
        }
        bool operator!=(const Iterator& other) const
        {
            return !(*this == other);
        }
        const Iterator& operator++() {
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
        const Iterator operator++(int)
        {
            Iterator next = *this;
            ++(*this);
            return next;
        }
        const T& operator*()
        {
            return ptr->m_value;
        }
        T operator->()
        {
            *this;
        }
        private:
            binary_tree* ptr = nullptr;
            std::stack<binary_tree*> stack{};
    };
public:
    const Iterator begin()
    {
        return Iterator(*this);
    }
    const Iterator end()
    {
        return Iterator(); 
    }

private:
    std::unique_ptr<binary_tree> m_left;
    std::unique_ptr<binary_tree> m_right;
    T m_value{};

};

}  // namespace binary_search_tree

#endif // BINARY_SEARCH_TREE_H
