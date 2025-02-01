# Purpose of Fork
I forked this repo because I use Chiitrans myself and since the code was available, I wanted to learn more about it and play with it. The main goals of this for are:
* Remove depreciated features (e.g. text hooking, people use [Textractor](https://github.com/Artikash/Textractor) these days...) 
* Understand parsing algorithm
* Understand code structure in general 

## Parsing Analysis
Based on how it works and rough analysis, i.e., not a close look at source code, we can assume parsing does the following:
1. Accept text from clipboard as input
2. Segment the text somehow / Find Morphemes
3. Get the Lemma of the Morpehemes
4. Perform a dictionary lookup of the Lemma on `JMdict.xml` and `JMnedict.xml`

Step 4 we can confirm by looking at the output Chiirans gives. For example `男` by itself has 8 translation pop ups.
If we do:
```sh
> grep -P -B3 -A50 '>男<' JMdict.xml
```
And look at the first `entry` element, we see:
```
<entry>
<ent_seq>1419990</ent_seq>
<k_ele>
<keb>男</keb>
<ke_pri>ichi1</ke_pri>
<ke_pri>news1</ke_pri>
<ke_pri>nf01</ke_pri>
</k_ele>
<r_ele>
<reb>おとこ</reb>
<re_pri>ichi1</re_pri>
<re_pri>news1</re_pri>
<re_pri>nf01</re_pri>
</r_ele>
<r_ele>
<reb>おっこ</reb>
<re_inf>&ok;</re_inf>
</r_ele>
<sense>
<pos>&n;</pos>
<pos>&n-pref;</pos>
<xref>女・おんな・1</xref>
<gloss>man</gloss>
<gloss>male</gloss>
</sense>
<sense>
<pos>&n;</pos>
<gloss>fellow</gloss>
<gloss>guy</gloss>
<gloss>chap</gloss>
<gloss>bloke</gloss>
</sense>
<sense>
<pos>&n;</pos>
<gloss>male lover</gloss>
<gloss>boyfriend</gloss>
<gloss>man</gloss>
</sense>
<sense>
<pos>&n;</pos>
<gloss>manliness</gloss>
<gloss>manly honor</gloss>
<gloss>manly honour</gloss>
<gloss>manly reputation</gloss>
</sense>
</entry>
```
Which corresponds to every information visible in the first definition window displayed on Chiitrans.
```
# Definition Typed Out:
Furigana: おとこ
- man; male おとこ
- fellow; guy; chap; bloke おとこ おっこ
- male lover; boyfriend; man
- manliness; manly; honor; manly honour; manly reputation
(n, n-pref)
(ichi1, news1, nf01)
```

So the order of the translation is determined by the order in the dictionary. I suspect Chiitrans is not intelligent enough to figure out which definition is most suitable depending on context. It just shows the definition in the order it found them. 
Perhaps the people who made these XML files structured the order according to frequency, which might give you the impression that Chiitrans is rather good at finding the right definition from the start.
It's also worth mentioning that in my case, it displayed 8 definitions but when doing the grep search, we get:

```
> grep -Phc '>男<' *.xml
5
7
```
So there must be some kind of way it decides to what definition it will display and what not. At least for the named entities. For the regular dictionary definitions, it seems to take all of them.

# Chiitrans Lite
Chiitrans Lite is an automatic translation tool for Japanese visual novels. It extracts, parses and translates text into English on the fly.

Chiitrans Lite is the successor of the project [Chiitrans](http://code.google.com/p/chiitrans/).

Visit http://alexbft.github.io/chiitrans/ for more info.

# Differences between Chiitrans and Chiitrans Lite
## New features
* Using modified [ITH](http://code.google.com/p/interactive-text-hooker/) engine for text extraction
* That means support for multiple user hooks (AGTH codes)
* Japanese proper names dictionary ([JMnedict](http://www.csse.monash.edu.au/~jwb/enamdict_doc.html)) support
* Improved parsing algorithm
* PO files support
* ATLAS Environment setting
* Lots of usability improvements

## Removed features
* Translation to languages other than English.
* Parsing: MeCab support
* Parsing: WWWJDIC support
* No arbitrary text replacements
* No user dictionary words (except names)
* No crowdsourced translations
* "Fullscreen" mode

# System requirements
## Minimal
* Windows XP or later
* .NET Framework 4
* Internet Explorer 8+
* 250 MB of free memory

## Recommended
* Windows 7 or later
* .NET Framework 4
* Internet Explorer 10+
* 600 MB of free memory
* [ATLAS V14](http://www.fujitsu.com/global/services/software/translation/atlas/index.html) installed

# Other project mentions
* [JMDict](http://www.csse.monash.edu.au/~jwb/jmdict.html) - Japanese-English dictionary used in Chiitrans Lite
* [Translation Aggregator](http://www.hongfire.com/forum/showthread.php/94395-Translation-Aggregator-v0-4-9) - Insight for ATLAS integration, conjugations list, and more. Many thanks to author!
* [AGTH](https://sites.google.com/site/agthook/) - A text extraction tool used in the previous version of Chiitrans. In this version, AGTH is only needed for launching programs using AppLocale without annoying dialog boxes.
* [ITH](http://code.google.com/p/interactive-text-hooker/) - Original text extraction engine
* [Visual Nover Reader](https://code.google.com/p/annot-player/) - Modified text extraction engine (vnr\*.dll). The project is huge, I have used only these dll files from this project.
* [Locale Emulator](https://github.com/xupefei/Locale-Emulator) - An AppLocale alternative

# License
    Copyright 2013-2014 alexbft

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this software except in compliance with the License.
    You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.