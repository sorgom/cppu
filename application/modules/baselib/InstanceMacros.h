//  ============================================================
//  instance declaration & definion macros
//  ============================================================
//  created by Manfred Sorgo

#pragma once
#ifndef INSTANCEMACROS_H
#define INSTANCEMACROS_H

//  CLASS HEADER MACROS
#define INSTANCE_DEC(cName) \
    static cName& instance();

#define INSTANCE_DEC_CONST(cName) \
    static const cName& instance();

//  use this one to provide instance for ddi
#define DDI_INSTANCE_DEC(cName) INSTANCE_DEC(cName)

//  CLASS SOURCE FILE MACROS
#define INSTANCE_DEF(cName) \
    cName& cName::instance() \
    { \
        static cName instance; \
        return instance; \
    }

#define INSTANCE_DEF_CONST(cName) \
    const cName& cName::instance() \
    { \
        static const cName instance; \
        return instance; \
    }

#endif // _H
