#pragma once
#ifndef TESTGROUPBASE_H
#define TESTGROUPBASE_H

#include <testlib/CppUTest.h>
#include <mocks/M_Instances.h>

namespace test
{
    class TestGroupBase : public Utest
    {
    protected:
        // inline TestGroupBase()
        // {}
        
        inline ~TestGroupBase()
        {
            unmock();
        }

        inline void teardown()
        {
            CHECK_N_CLEAR()

        }
    };
}

#endif // _H













