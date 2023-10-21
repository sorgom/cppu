//  ============================================================
//  class TSW_Hub implements I_TSW_Hub
//  ============================================================
//  created by Manfred Sorgo

#pragma once
#ifndef TSW_HUB_H
#define TSW_HUB_H

#include <baselib/InstanceMacros.h>
#include <baselib/StackArray.h>
#include <ifs/DataTypes.h>
#include <ifs/I_TSW_Hub.h>
#include <setup/capacities.h>
#include <TSW/TSW.h>

class TSW_Hub : public I_TSW_Hub
{
public:
    inline TSW_Hub()
    {}

//  TODO:
    inline void toFld(UINT32 id, INT32 cmd) const {}
    inline void toGui(UINT32 id, INT32 cmd) const {}

    inline void fromFld(const FldState& tele, UINT32 pos) {}
    inline void fromGui(const GuiCmd&   tele, UINT32 pos) {}

    bool load(UINT32 num, const ProjTSW* data);

    DDI_INSTANCE_DEC(TSW_Hub)
};

#endif // _H