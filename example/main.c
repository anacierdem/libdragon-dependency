#include <libdragon.h>
#include <libmain.h>

int main(void)
{
    init_interrupts();
    console_init();

    console_set_debug(true);
    debug_init_usblog();

    print_hello();

    while(1) {}
}
