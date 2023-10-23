//  ============================================================
//  test of basic functionality
//  - sizes of base types
//  - pack headers
//  - output of fixed size strings
//  ============================================================
//  created by Manfred Sorgo

#include <testlib/TestGroupBase.h>

#include <sstream>

namespace test
{

    TEST_GROUP_BASE(BT_01, TestGroupBase)
    {
        
    };

#define S_CHECK(SIZE, TYPE) \
    L_CHECK_EQUAL(SIZE, sizeof(TYPE))    
    
    //  integer sizes (check)
    TEST(BT_01, T01)
    {
        STEP(1)
        S_CHECK(1, UINT8)
        S_CHECK(2, UINT16)
        S_CHECK(4, UINT32)
        S_CHECK(8, UINT64)

        STEP(2)
        S_CHECK(1, INT8)
        S_CHECK(2, INT16)
        S_CHECK(4, INT32)
        S_CHECK(8, INT64)

        STEP(3)
        S_CHECK(1, BYTE)
        S_CHECK(1, CHAR)
    }

    struct Unpacked
    {
        UINT8  m1;
        UINT32 m2;
    };

    #include <baselib/packBegin.h>

    struct Packed
    {
        UINT8  m1;
        UINT32 m2;
    };

    #include <baselib/packEnd.h>

    //  Test of pack 
    TEST(BT_01, T02)
    {
        STEP(1)
        CHECK_EQUAL(8, sizeof(Unpacked));

        STEP(2)
        CHECK_EQUAL(5, sizeof(Packed));
    }

    //  ostreams
    TEST(BT_01, T03)
    {
        STEP(1)
        ElementName fn = {{ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5' }};

        std::ostringstream os;
        os << fixC(fn.chars);
        STRCMP_EQUAL("0123456789012345", os.str().c_str());

        STEP(2)
        fn.chars[ 4]  = 0;
        fn.chars[10] = 127;
        os.str("");
        os << fixC(fn.chars);
        STRCMP_EQUAL("0123*56789*12345", os.str().c_str());
    }

}