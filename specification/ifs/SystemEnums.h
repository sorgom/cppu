//  ============================================================
//  system wide enumerations
//  -   E_Subsys subsystems
//  -   E_mod    modules
//  -   E_Err    errors
//  ============================================================
//  created by Manfred Sorgo

#pragma once
#ifndef SYSTEMENUMS_H
#define SYSTEMENUMS_H

#include <codebase/BaseTypes.h>

enum E_Subsys : UINT8
{
    SUBSYS_TSW,
    SUBSYS_SIG,
    SUBSYS_SEG,
    SUBSYS_LCR
};

enum E_Mod : UINT8
{
    MOD_COM,
    MOD_DISPATCHER,
    MOD_LOADER,
    MOD_READER,
    MOD_SIG,
    MOD_SIG_HUB,
    MOD_SIG_PROVIDER,
    MOD_TSW,
    MOD_TSW_HUB,
    MOD_TSW_PROVIDER,
    MOD_LCR,
    MOD_LCR_HUB,
    MOD_LCR_PROVIDER
};

enum E_Err : UINT8
{
    ERR_MATCH,
    ERR_RANGE,
    ERR_STARTUP
};
                

#endif // _H