#pragma once

struct Context;
struct Node;

// General container
template<typename T>
struct Vector {
    T* data; int size;
    Vector(const Vector<T>& src) { data=src.data; size=sizeof(T); };
};

// Internal stuff
struct Context {
    Vector<Node> Nodes;
};

// API
Context* GetContext();
