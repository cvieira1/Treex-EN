#!/usr/bin/env perl

# Some of these verbs do not have doubled consonant in American English
# e.g. British cancelled vs. American canceled
# Most of the American verbs are handled by rules, but some are included
# in verbs_not_ending_with_e.pl
my @DATA = qw(
    abat abet abhor abut accur acquit adlib admit aerobat aerosol
    agendaset allot alot anagram annul appal apparel armbar aver babysit
    airdrop appal blackleg bobsled bur chum confab counterplot curet dib
    backdrop backfil backflip backlog backpedal backslap backstab bag
    balfun ballot ban bar barbel bareleg barrel bat bayonet becom bed
    bedevil bedwet beenhop befit befog beg beget begin bejewel bemedal
    benefit benum beset besot bestir bet betassel bevel bewig bib bid
    billet bin bip bit bitmap blab blag blam blan blat blim blip blob
    bloodlet blot blub blur bob bodypop bog booby-trap boobytrap booksel
    bootleg bop bot bowel bracket brag brig brim bud buffet bug bullshit
    bum bun bus but cab cabal cam can cancel cap caracol caravan carburet
    carnap carol carpetbag castanet cat catcal catnap cavil chan chanel
    channel chap char chargecap chat chin chip chir chirrup chisel chop
    chug chur clam clap clearcut clip clodhop clog clop closet clot club
    co-occur co-program co-refer co-run co-star cob cobweb cod coif com
    combat comit commit compel con concur confer confiscat control cop
    coquet coral corbel corral cosset cotransmit councel council counsel
    court-martial crab cram crap crib crop crossleg cub cudgel cum cun cup
    cut dab dag dam dan dap daysit de-control de-gazet de-hul de-instal
    de-mob de-program de-rig de-skil deadpan debag debar debug decommit
    decontrol defer defog deg degas deinstal demit demob demur den denet
    depig depip depit der deskil deter devil diagram dial dig dim din dip
    disbar disbud discomfit disembed disembowel dishevel disinter dispel
    disprefer distil dog dognap don doorstep dot dowel drag drat driftnet
    distil egotrip enrol enthral extol fulfil gaffe golliwog idyl inspan
    drip drivel drop drub drug drum dub duel dun dybbuk earwig eavesdrop
    ecolabel eitherspigot electroblot embed emit empanel enamel endlabel
    endtrim enrol enthral entrammel entrap enwrap equal equip estop
    exaggerat excel expel extol fag fan farewel fat featherbed feget fet
    fib fig fin fingerspel fingertip fit flab flag flap flip flit flog
    flop fob focus fog footbal footslog fop forbid forget format
    fortunetel fot foxtrot frag freefal fret frig frip frog frug fuel
    fufil fulfil fullyfit fun funnel fur furpul gab gad gag gam gambol gap
    garot garrot gas gat gel gen get giftwrap gig gimbal gin glam glenden
    glendin globetrot glug glut gob goldpan goostep gossip grab gravel
    grid grin grip grit groundhop grovel grub gum gun gunrun gut gyp haircut
    ham han handbag handicap handknit handset hap hareleg hat headbut
    hedgehop hem hen hiccup highwal hip hit hobnob hog hop horsewhip
    hostel hot hotdog hovel hug hum humbug hup hushkit hut illfit imbed
    immunblot immunoblot impannel impel imperil incur infer infil inflam
    initial input inset instil inter interbed intercrop intercut interfer
    instil intermit japan jug kris manumit mishit mousse mud
    interwar jab jag jam jar jawdrop jet jetlag jewel jib jig jitterbug
    job jog jog-trot jot jut ken kennel kid kidnap kip kissogram kit knap
    kneecap knit knob knot kor label lag lam lap lavel leafcut leapfrog
    leg lem lep let level libel lid lig lip lob log lok lollop longleg lop
    lowbal lug mackerel mahom man map mar marshal marvel mat matchwin
    metal micro-program microplan microprogram milksop mis-cal mis-club
    mis-spel miscal mishit mislabel mit mob mod model mohmam monogram mop
    mothbal mug multilevel mum nab nag nan nap net nightclub nightsit nip
    nod nonplus norkop nostril not nut nutmeg occur ocur offput offset
    omit ommit onlap out-general out-gun out-jab out-plan out-pol out-pul
    out-put out-run out-sel outbid outcrop outfit outgas outgun outhit
    outjab outpol output outrun outship outshop outsin outstrip outswel
    outspan overcrop pettifog photostat pouf preset prim pug ret rosin
    outwit over-commit over-control over-fil over-fit over-lap over-model
    over-pedal over-pet over-run over-sel over-step over-tip over-top
    overbid overcal overcommit overcontrol overcrap overdub overfil
    overhat overhit overlap overman overplot overrun overshop overstep
    overtip overtop overwet overwil pad paintbal pan panel paperclip par
    parallel parcel partiescal pat patrol pedal peewit peg pen pencil pep
    permit pet petal photoset phototypeset phut picket pig pilot pin
    pinbal pip pipefit pipet pit plan plit plod plop plot plug plumet
    plummet pod policyset polyfil ponytrek pop pot pram prebag predistil
    predril prefer prefil preinstal prep preplan preprogram prizewin prod
    profer prog program prop propel pub pummel pun pup pushfit put quarel
    quarrel quickskim quickstep quickwit quip quit quivertip quiz rabbit
    rabit radiolabel rag ram ramrod rap rat ratecap ravel re-admit re-cal
    re-cap re-channel re-dig re-dril re-emit re-fil re-fit re-flag
    re-format re-fret re-hab re-instal re-inter re-lap re-let re-map
    re-metal re-model re-pastel re-plan re-plot re-plug re-pot re-program
    re-refer re-rig re-rol re-run re-sel re-set re-skin re-stal re-submit
    re-tel re-top re-transmit re-trim re-wrap readmit reallot rebel rebid
    rebin rebut recap rechannel recommit recrop recur recut red redril
    refer refit reformat refret refuel reget regret reinter rejig rekit
    reknot relabel relet rem remap remetal remit remodel reoccur rep repel
    repin replan replot repol repot reprogram rerun reset resignal resit
    reskil resubmit retransfer retransmit retro-fit retrofit rev revel
    revet rewrap rib richochet ricochet rid rig rim ringlet rip rit rival
    rivet roadrun rob rocket rod roset rot rowel rub run runnel rut sab
    sad sag sandbag sap scab scalpel scam scan scar scat schlep scrag
    scram shall sled smut stet sulfuret trepan unrip unstop whir whop wig
    scrap scrat scrub scrum scud scum scur semi-control semi-skil
    semi-skim semiskil sentinel set shag sham shed shim shin ship shir
    shit shlap shop shopfit shortfal shot shovel shred shrinkwrap shrivel
    shrug shun shut side-step sideslip sidestep signal sin sinbin sip sit
    skid skim skin skip skir skrag slab slag slam slap slim slip slit slob
    slog slop slot slowclap slug slum slur smit snag snap snip snivel snog
    snorkel snowcem snub snug sob sod softpedal son sop spam span spar
    spat spiderweb spin spiral spit splat split spot sprag spraygun sprig
    springtip spud spur squat squirrel stab stag star stem sten stencil
    step stir stop storytel strap strim strip strop strug strum strut stub
    stud stun sub subcrop sublet submit subset suedetrim sum summit sun
    suntan sup super-chil superad swab swag swan swap swat swig swim
    swivel swot tab tag tan tansfer tap tar tassel tat tefer teleshop
    tendril terschel th'strip thermal thermostat thin throb thrum thud
    thug tightlip tin tinsel tip tittup toecap tog tom tomorrow top tot
    total towel traget trainspot tram trammel transfer tranship transit
    transmit transship trap travel trek trendset trim trip tripod trod
    trog trot trousseaushop trowel trup tub tug tunnel tup tut twat twig
    twin twit typeset tyset un-man unban unbar unbob uncap unclip uncompel
    undam under-bil under-cut under-fit under-pin under-skil underbid
    undercut underlet underman underpin unfit unfulfil unknot unlip
    unlywil unman unpad unpeg unpin unplug unravel unrol unscrol unsnap
    unstal unstep unstir untap unwrap unzip up upset upskil upwel ven
    verbal vet victual vignet wad wag wainscot wan war water-log waterfal
    waterfil waterlog weasel web wed wet wham whet whip whir whiteskin
    whiz whup wildcat win windmil wit woodchop woodcut wor worship wrap
    will wiretap yen yak yap yarnspin yip yodel zag zap zig zig-zag zigzag
    zip ztrip
);

sub analyze() {
    foreach my $stem (@DATA) {
        my $double = $stem;
        $double =~ s/(.)$/$1$1/;
        print "${double}ed\tVBD\t$stem\n";
        print "${double}ed\tVBN\t$stem\n";
        print "${double}ing\tVBG\t$stem\n";
    }
    return;
}

if ( $ARGV[0] eq '-a' ) { analyze(); }
elsif ( $ARGV[0] eq '-d' ) {
    foreach (@DATA) { print "$_\n"; }
}
else { die "Invalid usage: use option -a or -d\n"; }
