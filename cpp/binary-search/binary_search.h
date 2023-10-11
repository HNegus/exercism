#if !defined(BINARY_SEARCH_H)
#define BINARY_SEARCH_H

#include <stdexcept>

namespace binary_search {

template<template<typename> typename C, typename T>
auto find(C<T> container, T value) {
    auto r_lim = container.end();
    auto l_lim = container.begin();
    if (l_lim == r_lim) {
        throw std::domain_error("Empty container");
    }
    auto index = l_lim + (r_lim - l_lim) / 2;
    while (1) {
        const T test = *index;
        if (test == value) {
            return index - container.begin();
        } 
        if (test > value) {
            r_lim = index; 
        } else {
            l_lim = index;
        }
        auto new_index = l_lim + (r_lim - l_lim) / 2;
        if (new_index == index) {
            break;
        }
        index = new_index;
    }
    throw std::domain_error("Element not found");
}

}  // namespace binary_search

#endif // BINARY_SEARCH_H
