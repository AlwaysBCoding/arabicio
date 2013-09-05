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

* Sound ( All three root letters are consonants )
  - Treat normally

* Doubled ( The second and third root letter are the same )
  - Figure out how to convey a shadda + short vowel

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

Algorithm II - Categorizing the root based on the three letters
===============================================================

The second algorithm will look at the three letter root and categorize it into a root-category - and if possible - further divide it into a root-subcategory

Algorithm III - Finding matching information on stem extrapolation from input
============================================================================

The third algorithm will check the current verb form against all possible conjugations of the root category. The possible conjugations will be the full conjugation table at each measure the stem exists in.

Stem JSON Response
==================

After the stem is parsed, and the extrapolation is matched, a JSON response of all the possible candidates will be returned to the client.

Will consist of:
  * A full, vocalized, conjugation table in the perfect and imperfect
  * A list of possible measures and the definitions of each
  * A hit to the google translate API

The data will then display on the page in a nice tabular format, with the matching information from the second algorithm highlighted. The search query will be saved with a timestamp and the IP address of the requesting computer

Future Verticals
================
* Use the dynamic conjugation creation to make quizzes that throw out a word and ask for a random conjugation ( while teaching the meaning )
* Frequency mapping to give roots a weight for the algorithm to use
* Create a news.arabic.io subdomain that has a Hacker News style message board for news related to the middle east, and Americans interested in detailed discussion about the current state of affairs, instead of the propaganda that we're currently exposed to
