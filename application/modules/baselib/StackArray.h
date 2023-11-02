#pragma once
#ifndef STACKARRAY_H
#define STACKARRAY_H

#include <baselib/I_Searchable.h>
#include <baselib/BaseLib.h>
#include <baselib/coding.h>
#include <baselib/Mem.h>

#include <new>

template <class T, UINT32 CAP>
class StackArray : public I_Searchable<T>
{
public:
    inline StackArray():
        mData(reinterpret_cast<T*>(mBytes)),
        mSize(0)
    {}

    inline static UINT32 capacity()
    {
        return CAP;
    }

    inline void reset()
    {
        mSize = 0;
    }

    inline UINT32 size() const
    {
        return mSize;
    }

    inline bool isFull() const
    {
        return mSize >= CAP;
    }

    inline bool hasSpace() const
    {
        return mSize < CAP;
    }

    inline bool has(UINT32 pos) const
    {
        return pos < mSize;
    }

    inline UINT32 add(const T& obj)
    {
        Mem::cpy(at(mSize), obj);
        return mSize++;
    }

    inline const T* getData() const
    {
        return mData;
    }

    inline PTR getPtr(UINT32 pos)
    {
        return mBytes + sizeof(T) * pos;
    }

    inline CPTR getPtr(UINT32 pos) const
    {
        return mBytes + sizeof(T) * pos;
    }

    inline PTR addPtr() 
    {
        return getPtr(mSize++);
    }

    inline const T& at(UINT32 pos) const
    {
        return mData[pos];
    }
    inline T& at(UINT32 pos)
    {
        return mData[pos];
    }
    inline const T& operator [](UINT32 pos) const
    {
        return mData[pos];
    }
    inline T& operator [](UINT32 pos)
    {
        return mData[pos];
    }

    inline void sort()
    {
        bSort(*this);
    }

    inline UINT32 dupCnt() const
    {
        return dupCnt(*this);
    }

    inline INT32 find(const T& obj) const
    {
        return bSearch(*this, obj);
    }

    inline void swap(UINT32 posA, UINT32 posB)
    {
        swapBytes(getPtr(posA), getPtr(posB), mSwap, sizeof(T));
    }

private:
    BYTE mBytes[sizeof(T) * CAP];
    BYTE mSwap[sizeof(T)];
    T* mData;
    UINT32 mSize;

    NOCOPY(StackArray)
};

template <class T, UINT32 CAP>
class SimpleStackArray : public StackArray<T, CAP>
{
public:
    inline SimpleStackArray()
    {}
    
    inline bool isGreater(const T& a, const T& b) const
    {
        return false;
    }
    inline void sort() {}

    inline UINT32 dupCnt() const { return 0; }

    inline INT32 find(const T& obj) const { return -1; }

    inline void swap(UINT32 posA, UINT32 posB) {}

    NOCOPY(SimpleStackArray)
};

template <class T, UINT32 CAP>
class StackArrayIndex : public StackArray<CRef<T>, CAP>
{
public:
    inline StackArrayIndex(const StackArray<T, CAP>& a):
        mArray(a)
    {}

    inline bool isGreater(const CRef<T>& a, const CRef<T>& b) const
    {
        return mArray.isGreater(a.ref(), b.ref());
    }

    void adapt()
    {
        this->reset();
        for (UINT32 p = 0; p < mArray.size(); ++p)
        {
            new (this->addPtr()) CRef<T>(mArray[p]);
        }
        this->sort();
    }

    inline INT32 findRef(const T& obj) const
    {
        return this->find(CRef<T>(obj));
    }

    inline const T& getRef(UINT32 pos) const
    {
        return this->at(pos).ref();
    }

private:
    const StackArray<T, CAP>& mArray;

    NOCOPY(StackArrayIndex)
    StackArrayIndex();
};

template <UINT32 SIZE, UINT32 CAP>
class StackByteArray
{
public:
    inline StackByteArray():
        mSize(0)
    {}

    inline static UINT32 capacity()
    {
        return CAP;
    }

    inline void reset()
    {
        mSize = 0;
    }

    inline UINT32 size() const
    {
        return mSize;
    }

    inline bool isFull() const
    {
        return mSize >= CAP;
    }

    inline bool hasSpace() const
    {
        return mSize < CAP;
    }

    inline bool has(UINT32 pos) const
    {
        return pos < mSize;
    }

    inline PTR getPtr(UINT32 pos)
    {
        return mBytes + SIZE * pos;
    }

    inline CPTR getPtr(UINT32 pos) const
    {
        return mBytes + SIZE * pos;
    }

    inline PTR addPtr() 
    {
        return getPtr(mSize++);
    }
private:
    BYTE mBytes[SIZE * CAP];
    UINT32 mSize;
};

#endif // H_