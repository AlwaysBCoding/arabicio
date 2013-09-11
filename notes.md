Project Plan:

Goal - Create an Arabic Language stemming algorithm for verbs that can parse a verb in any tense into it's stem.

Vocabulary
==========

For the purpose of this project a STEM consists of five elements
1. An array of three or four letters comprising the stems root
2. An array of possible measures that a root can exist in
3. "vocalization" hstore which consists of a "perfect_kicker" and an "imperfect_kicker"
4. An array of possible verbal nouns
5. Notes in a text field

Algorithm I - Stemming from input
=================================

My first idea for this algorithm is to run a recursive method that checks the most likely stem for a given configuration. If the stem exists in the database, then it is saved as a "candidate". Then the most likely letter is eliminated and the recursion runs again until there are only three letters remaining.

Algorithm II - Categorizing the root based on the three letters
===============================================================

The second algorithm will look at the three letter root and categorize it into a root-category - and if possible - further divide it into a root-subcategory

For now there are (8) top level root categories that a root pattern can be categorized as:

* Sound ( All three root letters are consonants )

* Doubled ( The second and third root letter are the same )

* Hollow ( The middle root letter is a vowel )
  - The middle vowel is either 'w' or 'y'

* Assimilated ( The first root letter is a vowel )
  - Verbs with 'w' as first letter. If it has 'aa' it is a HAMZATED verb. If it has 'y' then the 'y' serves as a consonant and it is considered a sound verb

* Defective ( The last root letter is a vowel )
  - The last letter is either 'w' or 'y'

* Hamzated ( One of the root letters is hamza )
  * Initial
    - These verbs are listed under 'aa' in the dictionary
  * Medial
  * Final

* Quadrilateral ( The root is four letters )
  - What do I do with these?

* Multiple ( Two of these circumstances exist )

Algorithm III - Finding matching information on stem extrapolation from input
============================================================================

The third algorithm will check the current verb form against all possible conjugations of the root category. The possible conjugations will be the full conjugation table at each measure the stem exists in.

Stem JSON Response
==================

After the stem is parsed, and the extrapolation is matched, a JSON response of all the possible candidates will be returned to the client.

Will consist of:
  * A full, vocalized, conjugation table in the perfect and imperfect
  * A list of possible measures and the definitions of each
  * A hit to the google translate API ( ? )

The data will then display on the page in a nice tabular format, with the matching information from the second algorithm highlighted. The search query will be saved with a timestamp and the IP address of the requesting computer

Conjugation Tables
==================

Conjugation tables will be fully vocalized and consist of (4) separate tables each containing (13) conjugations for a total of 52 conjugations. ( Perfect, Imperfect, Jussive, Subjunctive )
There are (5) conjugations for the Imperative
Then there are an additional (3) special forms ( Active Participle, Passive Participle, Verbal Noun)
These 60 conjugations for a stem in a specific measure will be called the "Base 60"
*-* One thing to note is that Form I verbs can have multiple verbal nouns which means that the verbal nouns will be returned in the form of an array

The four tables will be:
  * Perfect ( past )
  * Imperfect ( present )
  * Jussive ( commands )
  * Subjunctive ( passive voice )
The fifth table is:
  * Imperative
The sixth table is:
  * Active Participle
  * Passive Participle
  * Verbal Noun

The 13 conjugations will be:
  * 5 singular
  * 5 plural
  * 3 dual

*-* Note to self *-*
This arrangement almost perfectly mimics the arrangement of a deck of cards

Future Verticals
================
* Use the dynamic conjugation creation to make quizzes that throw out a word and ask for a random conjugation ( while teaching the meaning )
* Frequency mapping to give roots a weight for the algorithm to use
* Create a news.arabic.io subdomain that has a Hacker News style message board for news related to the middle east, and Americans interested in detailed discussion about the current state of affairs, instead of the propaganda that we're currently exposed to

OBSERVATIONS
============
Subjunctive & Jussive mostly the same ( except for ending vowel on the big 5 ) for Form I
The vocalization patterns are mostly the same for everything ( the consonants are what alter )

Development Schedule
====================
1. Refactor the StemParsing algorithm to abstract common patterns and reduce #LOC in the algorithm
2. Add "Multiple" conjugation tables, and think of a way to make the conjugation entry process less tedious
3. Create a web UI to parse the verb, return a stem object with conjugations + highlight on candidate conjugations
