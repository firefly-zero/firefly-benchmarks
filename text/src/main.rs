#![no_std]
#![no_main]
use firefly_rust::*;

static STRINGS: [&str; 18] = [
    "The quick brown fox jumps over the lazy dog.",
    "Quick nymph bugs vex fjord waltz.",
    "Waltz, bad nymph, for quick jigs vex.",
    "Glib jocks quiz nymph to vex dwarf.",
    "Sphinx of black quartz, judge my vow.",
    "How quickly daft jumping zebras vex!",
    "The five boxing wizards jump quickly.",
    "Jackdaws love my big sphinx of quartz.",
    "In 1977, Joseph Weisbecker released COSMAC VIP. It was a personal computer designed\nfor writing and playing video games. The whole idea of video games was quite new.",
    "Tetris was created only in 1985 (8 years after COSMAC VIP). Pong was released in 1972,\nbut it was an arcade game, and you would play it on a special big machine designed to",
    "run just this one thing. The idea of a computer that is designed for games and can be\nused to both write and play them was big. COSMAC VIP was powered by CHIP-8. It's a",
    "programming language designed to be easy to use (and to learn) and to consume very\nlittle memory. It's an interpreted language, which means you can write a command",
    "(or modify existing code), press a button, and immediately see the result on the screen.\nThere is no long compilation step or going between computers. CHIP-8 was very fun to",
    "use and it still has a small but passionate community of people writing games for it.\nCOSMAC VIP also included several games created by Joyce Weisbecker, the daughter of COSMAC's creator. Most likely, she is the first woman video game developer in history.",
    "We happened to be born decades after CHIP-8 and all these early computers. So, for us,\nall this old tech, retro games, and early programming languages is more of a fascinating",
    "archeological discovery than a childhood memory. And we love them not out of nostalgia",
    "but out of appreciation of the engineering beauty, minimalism, and creativity that the",
    "constraints of the time sparkled.",
];

static mut F1: [u8; 655] = [0; _];
static mut F2: [u8; 772] = [0; _];
static mut OLD: bool = false;

#[unsafe(no_mangle)]
extern "C" fn boot() {
    load_file("f1", unsafe { &mut F1[..] });
    load_file("f2", unsafe { &mut F2[..] });
}

#[unsafe(no_mangle)]
extern "C" fn update() {
    let b = read_buttons(Peer::COMBINED);
    if b.w {
        unsafe { OLD = true };
    }
    if b.e {
        unsafe { OLD = false };
    }
}

#[unsafe(no_mangle)]
extern "C" fn render() {
    clear_screen(Color::White);
    unsafe {
        let (font, color) = if OLD {
            (FileRef::from_bytes(&F1[..]), Color::Red)
        } else {
            (FileRef::from_bytes(&F2[..]), Color::Green)
        };
        let font = font.into_font();
        let mut p = Point::new(0, 0);
        for s in STRINGS {
            draw_text(s, &font, p, color);
            p.x -= 1;
            p.y += 12;
        }
    }
}
