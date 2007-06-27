package Speech::eSpeak;

use 5.008008;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Speech::eSpeak ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	AUDIO_OUTPUT_PLAYBACK
	AUDIO_OUTPUT_RETRIEVAL
	AUDIO_OUTPUT_SYNCHRONOUS
	EE_BUFFER_FULL
	EE_INTERNAL_ERROR
	EE_OK
	N_SPEECH_PARAM
	POS_CHARACTER
	POS_SENTENCE
	POS_WORD
	espeakCAPITALS
	espeakCHARS_8BIT
	espeakCHARS_AUTO
	espeakCHARS_UTF8
	espeakCHARS_WCHAR
	espeakEMPHASIS
	espeakENDPAUSE
	espeakEVENT_LIST_TERMINATED
	espeakKEEP_NAMEDATA
	espeakLINELENGTH
	espeakPHONEMES
	espeakPITCH
	espeakPUNCTUATION
	espeakPUNCT_ALL
	espeakPUNCT_NONE
	espeakPUNCT_SOME
	espeakRANGE
	espeakRATE
	espeakSILENCE
	espeakSSML
	espeakVOLUME

				   espeak_Initialize
				   espeak_SetSynthCallback
				   espeak_SetUriCallback
				   espeak_Synth
				   espeak_Synth_Mark
				   espeak_Key
				   espeak_Char
				   espeak_SetParameter
				   espeak_GetParameter
				   espeak_SetPunctuationList
				   espeak_SetPhonemeTrace
				   espeak_CompileDictionary
				   espeak_ListVoices
				   espeak_SetVoiceByName
				   espeak_SetVoiceByProperties
				   espeak_GetCurrentVoice
				   espeak_Cancel
				   espeak_IsPlaying
				   espeak_Synchronize
				   espeak_Terminate
				   espeak_Info
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	AUDIO_OUTPUT_PLAYBACK
	AUDIO_OUTPUT_RETRIEVAL
	AUDIO_OUTPUT_SYNCHRONOUS
	Audio
	EE_BUFFER_FULL
	EE_INTERNAL_ERROR
	EE_OK
	End
	Mark
	N_SPEECH_PARAM
	POS_CHARACTER
	POS_SENTENCE
	POS_WORD
	Retrieval
	Start
	espeakCAPITALS
	espeakCHARS_8BIT
	espeakCHARS_AUTO
	espeakCHARS_UTF8
	espeakCHARS_WCHAR
	espeakEMPHASIS
	espeakENDPAUSE
	espeakEVENT_LIST_TERMINATED
	espeakKEEP_NAMEDATA
	espeakLINELENGTH
	espeakPHONEMES
	espeakPITCH
	espeakPUNCTUATION
	espeakPUNCT_ALL
	espeakPUNCT_NONE
	espeakPUNCT_SOME
	espeakRANGE
	espeakRATE
	espeakSILENCE
	espeakSSML
	espeakVOLUME
);

our $VERSION = '0.11';

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "&Speech::eSpeak::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { croak $error; }
    {
	no strict 'refs';
	# Fixed between 5.005_53 and 5.005_61
#XXX	if ($] >= 5.00561) {
#XXX	    *$AUTOLOAD = sub () { $val };
#XXX	}
#XXX	else {
	    *$AUTOLOAD = sub { $val };
#XXX	}
    }
    goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('Speech::eSpeak', $VERSION);

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Speech::eSpeak - Perl extension for eSpeak text to speech

=head1 SYNOPSIS

  use Speech::eSpeak ':all';
  espeak_Initialize(AUDIO_OUTPUT_PLAYBACK, 0, '');
  my $synth_flags = espeakCHARS_AUTO | espeakPHONEMES | espeakENDPAUSE;
  my $text = 'hello world';
  espeak_Synth($text, length($text) + 1, 0, POS_CHARACTER, 0, $synth_flags, 0, 0);
  espeak_Synchronize();

=head1 DESCRIPTION

eSpeak is a compact open source software speech synthesizer for English and other languages. It's written by Jonathan Duddington. You can find more information from L<http://espeak.sourceforge.net>. This package is direct binding for eSpeak, which is based on the API of speak_lib.h.

=head2 EXPORT

None by default.

=head2 Exportable constants

  AUDIO_OUTPUT_PLAYBACK
  AUDIO_OUTPUT_RETRIEVAL
  AUDIO_OUTPUT_SYNCHRONOUS
  EE_BUFFER_FULL
  EE_INTERNAL_ERROR
  EE_OK
  N_SPEECH_PARAM
  POS_CHARACTER
  POS_SENTENCE
  POS_WORD
  espeakCAPITALS
  espeakCHARS_8BIT
  espeakCHARS_AUTO
  espeakCHARS_UTF8
  espeakCHARS_WCHAR
  espeakEMPHASIS
  espeakENDPAUSE
  espeakEVENT_LIST_TERMINATED
  espeakKEEP_NAMEDATA
  espeakLINELENGTH
  espeakPHONEMES
  espeakPITCH
  espeakPUNCTUATION
  espeakPUNCT_ALL
  espeakPUNCT_NONE
  espeakPUNCT_SOME
  espeakRANGE
  espeakRATE
  espeakSILENCE
  espeakSSML
  espeakVOLUME

=head1 FUNCTIONS

=head2 espeak_SetSynthCallback($callback)

Not implemented yet.

=head2 espeak_SetUriCallback($callback)

Not implemented yet.

=head2 espeak_Synth($text, $size, $position, $position_type, $end_position, $flags, $unique_identifier, $user_data)

   Synthesize speech for the specified text.  The speech sound data is passed to the calling program in buffers by means of the callback function specified by espeak_SetSynthCallback(). The command is asynchronous: it is internally buffered and returns as soon as possible. If espeak_Initialize was previously called with AUDIO_OUTPUT_PLAYBACK as argument, the sound data are played by eSpeak.

   text: The text to be spoken, terminated by a zero character. It may be either 8-bit characters, wide characters (wchar_t), or UTF8 encoding.  Which of these is determined by the "flags" parameter.

   size: Equal to (or greatrer than) the size of the text data, in bytes.  This is used in order to allocate internal storage space for the text.  This value is not used for AUDIO_OUTPUT_SYNCHRONOUS mode.

   position:  The position in the text where speaking starts. Zero indicates speak from the start of the text.

   position_type:  Determines whether "position" is a number of characters, words, or sentences. SEE L</"espeak_POSITION_TYPE">

   end_position:  If set, this gives a character position at which speaking will stop.  A value of zero indicates no end position.

   flags:  These may be OR'd together:
      Type of character codes, one of:
         espeakCHARS_UTF8     UTF8 encoding
         espeakCHARS_8BIT     The 8 bit ISO-8859 character set for the particular language.
         espeakCHARS_AUTO     8 bit or UTF8  (this is the default)
         espeakCHARS_WCHAR    Wide characters (wchar_t)

      espeakSSML   Elements within < > are treated as SSML elements, or if not recognised are ignored.

      espeakPHONEMES  Text within [[ ]] is treated as phonemes codes (in espeak's Hirschenbaum encoding).

      espeakENDPAUSE  If set then a sentence pause is added at the end of the text.  If not set then
         this pause is suppressed.

   unique_identifier: message identifier; helpful for identifying later data supplied to the callback.

   user_data: pointer which will be passed to the callback function.

   Return: EE_OK: operation achieved 
           EE_BUFFER_FULL: the command can not be buffered; you may try after a while to call the function again.
           EE_INTERNAL_ERROR.

=head2 espeak_Synth_Mark($text, $size, $index_mark, $end_position, $flags, $unique_identifier, $user_data)

   Synthesize speech for the specified text.  Similar to espeak_Synth() but the start position is specified by the name of a <mark> element in the text.

   index_mark:  The "name" attribute of a <mark> element within the text which specified the point at which synthesis starts.  UTF8 string.

   For the other parameters, see espeak_Synth()

   Return: EE_OK: operation achieved
           EE_BUFFER_FULL: the command can not be buffered; you may try after a while to call the function again.
           EE_INTERNAL_ERROR.

=head2 espeak_Key($key_name)

   Speak the name of a keyboard key. Currently this just speaks the "key_name" as given

   Return: EE_OK: operation achieved
           EE_BUFFER_FULL: the command can not be buffered; you may try after a while to call the function again.
           EE_INTERNAL_ERROR.

=head2 espeak_Char($character)

   Speak the name of the given character

   Return: EE_OK: operation achieved
           EE_BUFFER_FULL: the command can not be buffered; you may try after a while to call the function again.
           EE_INTERNAL_ERROR.

=head2 espeak_SetParameter($parameter, $value, $relative)

   Sets the value of the specified parameter.
   relative=0   Sets the absolute value of the parameter.
   relative=1   Sets a relative value of the parameter.

   parameter:
      espeakRATE:    speaking speed in word per minute.

      espeakVOLUME:  volume in range 0-100    0=silence

      espeakPITCH:   base pitch, range 0-100.  50=normal

      espeakRANGE:   pitch range, range 0-100. 0-monotone, 50=normal

      espeakPUNCTUATION:  which punctuation characters to announce:
         value in espeak_PUNCT_TYPE (none, all, some), see espeak_GetParameter() to specify which characters are announced.

      espeakCAPITALS: announce capital letters by:
         0=none,
         1=sound icon,
         2=spelling,
         3 or higher, by raising pitch.  This values gives the amount in Hz by which the pitch
            of a word raised to indicate it has a capital letter.

   Return: EE_OK: operation achieved
           EE_BUFFER_FULL: the command can not be buffered; you may try after a while to call the function again.
           EE_INTERNAL_ERROR.

=head2 espeak_GetParameter($parameter, current)

   current=0  Returns the default value of the specified parameter.
   current=1  Returns the current value of the specified parameter, as set by SetParameter()

=head2 espeak_SetPunctuationList($punclist)

   Specified a list of punctuation characters whose names are to be spoken when the
   value of the Punctuation parameter is set to "some".

   punctlist:  A list of character codes, terminated by a zero character.

   Return: EE_OK: operation achieved 
           EE_BUFFER_FULL: the command can not be buffered; you may try after a while to call the function again.
           EE_INTERNAL_ERROR.


=head2 espeak_SetPhonemeTrace($value, $stream)

   Controls the output of phoneme symbols for the text
   value=0  No phoneme output (default)
   value=1  Output the translated phoneme symbols for the text
   value=2  as (1), but also output a trace of how the translation was done (matching rules and list entries)

   stream   output stream for the phoneme symbols (and trace).  If stream=NULL then it uses stdout.

=head2 espeak_CompileDictionary($path, $log)

   Compile pronunciation dictionary for a language which corresponds to the currently selected voice.  The required voice should be selected before calling this function.

   path:  The directory which contains the language's '_rules' and '_list' files.
          'path' should end with a path separator character ('/').
   log:   Stream for error reports and statistics information. If log=NULL then stderr will be used.

=head2 espeak_ListVoices($voice_spec)

   Reads the voice files from espeak-data/voices and creates an array of espeak_VOICE pointers. The list is terminated by a NULL pointer

   If voice_spec is NULL then all voices are listed.
   If voice spec is give, then only the voices which are compatible with the voice_spec are listed, and they are listed in preference order.

=head2 espeak_SetVoiceByName($name)

   Searches for a voice with a matching "name" field.  Language is not considered. "name" is a UTF8 string.

   Return: EE_OK: operation achieved
           EE_BUFFER_FULL: the command can not be buffered; you may try after a while to call the function again.
           EE_INTERNAL_ERROR.

=head2 espeak_SetVoiceByProperties($voice_spec)

   An espeak_VOICE structure is used to pass criteria to select a voice.  Any of the following fields may be set:

   name     NULL, or a voice name

   languages  NULL, or a single language string (with optional dialect), eg. "en-uk", or "en"

   gender   0=not specified, 1=male, 2=female

   age      0=not specified, or an age in years

   variant  After a list of candidates is produced, scored and sorted, "variant" is used to index that list and choose a voice.
            variant=0 takes the top voice (i.e. best match). variant=1 takes the next voice, etc

=head2 espeak_GetCurrentVoice()

   Returns the espeak_VOICE data for the currently selected voice.
   This is not affected by temporary voice changes caused by SSML elements such as <voice> and <s>

=head2 espeak_Cancel()

   Stop immediately synthesis and audio output of the current text. When this function returns, the audio output is fully stopped and the synthesizer is ready to synthesize a new message.

   Return: EE_OK: operation achieved
           EE_INTERNAL_ERROR.

=head2 epseak_IsPlaying()

   Returns 1 if audio is played, 0 otherwise.


=head2 espeak_Synchronize()

   This function returns when all data have been spoken.
   Return: EE_OK: operation achieved
           EE_INTERNAL_ERROR.

=head2 espeak_Terminate()

   last function to be called.
   Return: EE_OK: operation achieved
           EE_INTERNAL_ERROR.

=head2 espeak_Info()

   Returns the version number string.
   The parameter is for future use, and should be set to NULL

=head1 TYPES

=head2 espeak_POSITION_TYPE

   typedef enum {
        POS_CHARACTER = 1,
        POS_WORD,
        POS_SENTENCE
   } espeak_POSITION_TYPE;

=head2 espeak_AUDIO_OUTPUT

   typedef enum {
        /* PLAYBACK mode: plays the audio data, supplies events to the calling program*/
        AUDIO_OUTPUT_PLAYBACK,

        /* RETRIEVAL mode: supplies audio data and events to the calling program */
        AUDIO_OUTPUT_RETRIEVAL,

        /* SYNCHRONOUS mode: as RETRIEVAL but doesn't return until synthesis is completed */
        AUDIO_OUTPUT_SYNCHRONOUS,

        /* Synchronous playback */
        AUDIO_OUTPUT_SYNCH_PLAYBACK

   } espeak_AUDIO_OUTPUT;

=head2 espeak_ERROR

   typedef enum {
        EE_OK=0,
        EE_INTERNAL_ERROR=-1,
        EE_BUFFER_FULL=1,
        EE_NOT_FOUND=2
   } espeak_ERROR;

=head2 espeak_PARAMETER

   typedef enum {
        espeakSILENCE=0, /* internal use */
        espeakRATE,
        espeakVOLUME,
        espeakPITCH,
        espeakRANGE,
        espeakPUNCTUATION,
        espeakCAPITALS,
        espeakEMPHASIS,   /* internal use */
        espeakLINELENGTH, /* internal use */
        espeakVOICETYPE,  // internal, 1=mbrola
        N_SPEECH_PARAM    /* last enum */
   } espeak_PARAMETER;

=head2 espeak_PUNCT_TYPE

   typedef enum {
        espeakPUNCT_NONE=0,
        espeakPUNCT_ALL=1,
        espeakPUNCT_SOME=2
   } espeak_PUNCT_TYPE;

=head2 espeak_VOICE

   typedef struct {
        char *name;            // a given name for this voice. UTF8 string.
        char *languages;       // list of pairs of (byte) priority + (string) language (and dialect qualifier)
        char *identifier;      // the filename for this voice within espeak-data/voices
        unsigned char gender;  // 0=none 1=male, 2=female,
        unsigned char age;     // 0=not specified, or age in years
        unsigned char variant; // only used when passed as a parameter to espeak_SetVoiceByProperties
        unsigned char xx1;     // for internal use 
        int score;       // for internal use
        void *spare;     // for internal use
   } espeak_VOICE;

    Note: The espeak_VOICE structure is used for two purposes:
   1. To return the details of the available voices.
   2. As a parameter to  espeak_SetVoiceByProperties() in order to specify selection criteria.

   In (1), the "languages" field consists of a list of (UTF8) language names for which this voice may be used, each language name in the list is terminated by a zero byte and is also preceded by a single byte which gives a "priority" number.  The list of languages is terminated by an additional zero byte.

   A language name consists of a language code, optionally followed by one or more qualifier (dialect) names separated by hyphens (eg. "en-uk").  A voice might, for example, have languages "en-uk" and "en".  Even without "en" listed, voice would still be selected for the "en" language (because "en-uk" is related) but at a lower priority.

   The priority byte indicates how the voice is preferred for the language. A low number indicates a more preferred voice, a higher number indicates a less preferred voice.

   In (2), the "languages" field consists simply of a single (UTF8) language name, with no preceding priority byte.

=head1 EXAMPLE

  use strict;
  use Speech::eSpeak ':all';

  espeak_Initialize(AUDIO_OUTPUT_PLAYBACK, 0, '');

  my $synth_flags = espeakCHARS_AUTO | espeakPHONEMES | espeakENDPAUSE;
  espeak_Synth('hello world', 12, 0, POS_CHARACTER, 0, $synth_flags, 0, 0);

  espeak_Cancel() if espeak_IsPlaying;

  my $text = 'hello <mark name="newstart"> world';
  espeak_Synth_Mark($text, length($text) + 1, 'newstart', 0, espeakSSML, 0, 0);

  print 'rate: ', espeak_GetParameter(espeakRATE, 1), "\n";
  print 'volume: ', espeak_GetParameter(espeakVOLUME, 1), "\n";
  print 'pitch: ', espeak_GetParameter(espeakPITCH, 1), "\n";
  print 'range: ', espeak_GetParameter(espeakRANGE, 1), "\n";
  print 'punctuation: ', espeak_GetParameter(espeakPUNCTUATION, 1), "\n";
  print 'capitals: ', espeak_GetParameter(espeakCAPITALS, 1), "\n";

  my $voice = espeak_GetCurrentVoice();
  print 'name: ', $voice->name, "\n";
  print 'languages: ', $voice->languages, "\n";
  print 'identifier: ', $voice->identifier, "\n";
  print 'gender: ', $voice->gender, "\n";
  print 'age: ', $voice->age, "\n";
  print 'variant: ', $voice->variant, "\n";

  espeak_SetParameter(espeakPITCH, 100, 0);
  espeak_SetParameter(espeakRANGE, 100, 0);

  espeak_SetPhonemeTrace(2, \*STDOUT);

  espeak_Synchronize();

  print 'version: ', espeak_Info(0), "\n";

  my @voices = espeak_ListVoices('');
  foreach (@voices) {
    print $_->name;
  }

  espeak_Terminate();

=head1 SEE ALSO

eSpeak Documents, speak_lib.h, L<http://espeak.sourceforge.net>, L<eGuideDog::Festival>

=head1 AUTHOR

Cameron Wong, E<lt>hgn823-eguidedog at yahoo.com.cnE<gt>, L<http://e-guidedog.sourceforge.net>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc eGuideDog::Festival

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/eGuideDog-Festival>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/eGuideDog-Festival>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=eGuideDog-Festival>

=item * Search CPAN

L<http://search.cpan.org/dist/eGuideDog-Festival>

=head1 ACKNOWLEDGEMENT

eSpeak TTS is designed by Jonathan Duddington. L<http://espeak.sourceforge.net>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2007 by Cameron Wong

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5 you may have available.


=cut
