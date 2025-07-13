#include "SILKscreen_API.h"
#include "silk.h"

enum SILKscreen_Status SILKscreen_Init(char *script_path)
{
    return silk_startd(script_path);
}
