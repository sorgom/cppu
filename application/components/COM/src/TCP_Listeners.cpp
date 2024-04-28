#include <COM/TCP_Listeners.h>
#include <SYS/IL.h>

bool Tcp_Listener_Base::listen(const UINT16 port)
{
    const I_TCP& tcp = IL::getTCP();
    mSocket = tcp.socket();
    const bool ok =
        (mSocket >= 0)
        and tcp.bind(mSocket, port)
        and tcp.listen(mSocket);
    if (ok)
    {
        pass();
    }
    else
    {
        tcp.close(mSocket);
    }
    return ok;
}

bool Tcp_Listener_Base::select()
{
    const I_TCP& tcp = IL::getTCP();
    const INT32 res = tcp.select(mSocket);
    bool ok = 
        (res == 0)
        or (res > 0 and getCon().accept(mSocket));

    if (not ok) 
    {
        tcp.close(mSocket);
    }
    return ok;
}

void Tcp_Listener_Base::close()
{
    IL::getTCP().close(mSocket);
}

I_TCP_Con& TCP_Listener_Fld::getCon() const
{
    return IL::getTCP_Con_Fld();
}
INSTANCE_DEF(TCP_Listener_Fld)

I_TCP_Con& TCP_Listener_Gui::getCon() const
{
    return IL::getTCP_Con_Gui();
}
INSTANCE_DEF(TCP_Listener_Gui)

I_TCP_Con& TCP_Listener_Ctrl::getCon() const
{
    return IL::getTCP_Con_Ctrl();
}
INSTANCE_DEF(TCP_Listener_Ctrl)