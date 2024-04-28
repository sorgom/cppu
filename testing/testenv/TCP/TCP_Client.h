//  ============================================================
//  TCP test client
//  ============================================================
//  created by Manfred Sorgo

#pragma once

#include <BAS/coding.h>
#include <atomic>

namespace test
{
    class TCP_Client
    {
    public:
        TCP_Client() = default;
        //  connect to localhost with port
        //  works if test and app run in different processes
        bool connect(UINT16 port);

        bool send(CPTR data, INT32 size);

        template<typename T>
        inline bool send(const T& data)
        {
            return send(&data, sizeof(data));
        }

        bool recv(PTR data, INT32 size);

        template<typename T>
        inline bool recv(T& data)
        {
            return recv(&data, sizeof(data));
        }

        //  close connection
        void close();

        inline bool result() const { return mRes; } 
        //  set wait time in ms for thread based methods
        //  should be less than TCP select timeout
        inline void setWait(UINT32 ms) { mWait = ms; }
        NOCOPY(TCP_Client)
    private:
        INT32 mSocket = -1;
        std::atomic<bool> mRes = false;
        UINT32 mWait = 5;
        void _connect(UINT16 port);
    };

}