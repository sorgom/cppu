//  ============================================================
//  test of module LCR_Hub
//  ============================================================
//  created by Manfred Sorgo

#include <testlib/TestGroupBase.h>
#include <LCR/LCR_Hub.h>

namespace test
{
    class TestGroupLCH : public TestGroupBase
    {
    protected:
        LCR_Hub mSUT;
    };

    TEST_GROUP_BASE(LCR_02, TestGroupLCH) {};

    //  test type: equivalence class test
    //  fromDsp FldState
    TEST(LCR_02, T01)
    {
        SETUP()
        const FldState tele(101, 102);

        STEP(1)
        //  good case
        m_LCR_Provider().expectHas(11, true);
        m_LCR().expectFromFld(101, 102);
        mSUT.fromDsp(11, tele);
        CHECK_N_CLEAR()

        STEP(2)
        //  fail case
        m_LCR_Provider().expectHas(11, false);
        mSUT.fromDsp(11, tele);
        CHECK_N_CLEAR()
    }

    //  test type: equivalence class test
    //  fromDsp GuiCmd
    TEST(LCR_02, T02)
    {
        SETUP()
        const GuiCmd tele(201);
        
        STEP(1)
        //  good case
        m_LCR_Provider().expectHas(22, true);
        m_LCR().expectFromGui(201);
        mSUT.fromDsp(22, tele);
        CHECK_N_CLEAR()

        STEP(2)
        //  fail case
        m_LCR_Provider().expectHas(22, false);
        mSUT.fromDsp(22, tele);
        CHECK_N_CLEAR()
    }

    //  test type: equivalence class test
    //  toFld
    TEST(LCR_02, T03)
    {
        SETUP()
        CmdFld tele(301);

        STEP(1)
        m_Dispatcher().expectDispatch(3, tele);
        mSUT.toFld(3, 301);
        CHECK_N_CLEAR()
    }

    //  test type: equivalence class test
    //  toGui
    TEST(LCR_02, T04)
    {
        SETUP()
        StateGui tele(401, 402);
        
        STEP(1)
        m_Dispatcher().expectDispatch(4, tele);
        mSUT.toGui(4, 401, 402);
        CHECK_N_CLEAR()
    }
   
    //  test type: coverage
    //  retrieve instance
    TEST(LCR_02, T05)
    {
        I_LCR_Hub& inst = LCR_Hub::instance();
        play(inst);
    }
}
