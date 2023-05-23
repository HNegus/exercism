#include "simple_linked_list.h"

#include <stdexcept>

namespace simple_linked_list {

std::size_t List::size() const {
    return current_size;
}

void List::push(int entry) {
    current_size++;
    Element *e = new Element(entry);
    if (head == nullptr) {
        head = e;

        return;
    }
    e->next = head;
    head = e;
}

int List::pop() {
    // TODO: Implement a function that returns the data value of the first
    // element in the list then discard that element.
    if (head == nullptr) {
        return 0;
    }
    int value = head->data;
    Element *h = head;
    head = h->next;
    free(h);
    current_size--;
    return value;
}


void List::flip(Element* current, Element *next) {
    if (current == nullptr || next == nullptr) {
        return;
    }

    if (next->next != nullptr) {
        flip(next, next->next);
    } else {
        head = next;
    }
    next->next = current;
    current->next = nullptr;

}

void List::reverse() {
    // TODO: Implement a function to reverse the order of the elements in the
    // list.
    if (head == nullptr || head->next == nullptr) {
        return;
    }
    flip(head, head->next);
}

List::~List() {
    // TODO: Ensure that all resources are freed on destruction
    while (head != nullptr) {
        Element *e = head;
        head = e->next;
        free(e);
    }
}

}  // namespace simple_linked_list
