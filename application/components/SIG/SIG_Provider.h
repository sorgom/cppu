//  ============================================================
//  class SIG_Provider implements I_SIG_Provider
//  ============================================================
//  created by Manfred Sorgo

#ifndef SIG_PROVIDER_H
#define SIG_PROVIDER_H

#include <BAS/coding.h>
#include <BAS/BAS_Provider.h>

class SIG_Provider : public BAS_Provider
{
public:
    INSTANCE_DEC(SIG_Provider)
    NOCOPY(SIG_Provider)
protected:
    bool add(size_t id, const ProjItem& item) final;
    inline E_Comp comp() const final { return COMP_SIG; };
private:
    inline SIG_Provider() = default;
};
#endif // _H
