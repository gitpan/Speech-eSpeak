#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "speak_lib.h"

#include "const-c.inc"

#include <string.h>

typedef espeak_VOICE Speech_eSpeak_Voice;
typedef espeak_EVENT Speech_eSpeak_Event;

static SV * perl_synthcallback = (SV*)NULL;

int c_synthcallback(short *wav, int numsamples, espeak_EVENT *events)
{
	printf("enter c_synthcallback\n");
	printf("wav:, numsamples:%d, events:%d\n", numsamples, events->unique_identifier);
	if (perl_synthcallback == NULL) {
		printf("NULL\n");
	}
/*
	dSP;
	ENTER;
	SAVETMPS;
	PUSHMARK(SP);
	XPUSHs(sv_2mortal(newSVpv((SV*)wav, (size_t)strlen(wav))));
	XPUSHs(sv_2mortal(newSViv(numsamples)));
	XPUSHs(sv_2mortal(newSVsv((SV*)events)));
	PUTBACK;

	call_sv(perl_synthcallback, G_SCALAR);
	FREETMPS;
	LEAVE;
*/
	return 0;
}

MODULE = Speech::eSpeak		PACKAGE = Speech::eSpeak		
INCLUDE: const-xs.inc

IV
espeakEVENT_LIST_TERMINATED()
	CODE:
		RETVAL = espeakEVENT_LIST_TERMINATED;
	OUTPUT:
		RETVAL

IV
espeakEVENT_WORD()
	CODE:
		RETVAL = espeakEVENT_WORD;
	OUTPUT:
		RETVAL

IV
espeakEVENT_SENTENCE()
	CODE:
		RETVAL = espeakEVENT_SENTENCE;
	OUTPUT:
		RETVAL

IV
espeakEVENT_MARK()
	CODE:
		RETVAL = espeakEVENT_MARK;
	OUTPUT:
		RETVAL

IV
espeakEVENT_PLAY()
	CODE:
		RETVAL = espeakEVENT_PLAY;
	OUTPUT:
		RETVAL

IV
espeakEVENT_END()
	CODE:
		RETVAL = espeakEVENT_END;
	OUTPUT:
		RETVAL

IV
espeakEVENT_MSG_TERMINATED()
	CODE:
		RETVAL = espeakEVENT_MSG_TERMINATED;
	OUTPUT:
		RETVAL

IV
POS_CHARACTER()
	CODE:
		RETVAL = POS_CHARACTER;
	OUTPUT:	
		RETVAL

IV
POS_WORD()
	CODE:
		RETVAL = POS_WORD;
	OUTPUT:
		RETVAL

IV
POS_SENTENCE()
	CODE:
		RETVAL = POS_SENTENCE;
	OUTPUT:
		RETVAL

IV
AUDIO_OUTPUT_PLAYBACK()
	CODE:
		RETVAL = AUDIO_OUTPUT_PLAYBACK;
	OUTPUT:
		RETVAL

IV
AUDIO_OUTPUT_RETRIEVAL()
	CODE:
		RETVAL = AUDIO_OUTPUT_RETRIEVAL;
	OUTPUT:
		RETVAL

IV
AUDIO_OUTPUT_SYNCHRONOUS()
	CODE:
		RETVAL = AUDIO_OUTPUT_SYNCHRONOUS;
	OUTPUT:
		RETVAL

IV
AUDIO_OUTPUT_SYNCH_PLAYBACK()
	CODE:
		RETVAL = AUDIO_OUTPUT_SYNCH_PLAYBACK;
	OUTPUT:
		RETVAL

IV
EE_OK()
	CODE:
		RETVAL = EE_OK;
	OUTPUT:
		RETVAL

IV
EE_INTERNAL_ERROR()
	CODE:
		RETVAL = EE_INTERNAL_ERROR;
	OUTPUT:
		RETVAL

IV
EE_BUFFER_FULL()
	CODE:
		RETVAL = EE_BUFFER_FULL;
	OUTPUT:
		RETVAL

IV
EE_NOT_FOUND()
	CODE:
		RETVAL = EE_NOT_FOUND;
	OUTPUT:
		RETVAL

int
espeak_Initialize(output, buflength, path)
		IV		output
		int		buflength
		const char *	path

void
espeak_SetSynthCallback(SynthCallback)
		SV*		SynthCallback
	CODE:
		if (perl_synthcallback == (SV*)NULL)
			perl_synthcallback = newSVsv((SV*)SynthCallback);
		else
			SvSetSV(perl_synthcallback, (SV*)SynthCallback);
		espeak_SetSynthCallback(c_synthcallback);

void
espeak_SetUriCallback(UriCallback)
		SV*		UriCallback

IV
espeak_Synth(text, size, positon, position_type, end_position, flags, unique_identifier, user_data)
		const void *	text
		size_t		size
		unsigned int	positon
		IV		position_type
		unsigned int	end_position
		unsigned int	flags
		unsigned int *	unique_identifier
		void *		user_data

IV
espeak_Synth_Mark(text, size, index_mark, end_position, flags, unique_identifier, user_data)
		const void *	text
		size_t		size
		const char *	index_mark
		unsigned int	end_position
		unsigned int	flags
		unsigned int *	unique_identifier
		void *		user_data

IV
espeak_Key(key_name)
		const char *	key_name

IV
espeak_Char(character)
		wchar_t		character

IV
espeakSILENCE()
	CODE:
		RETVAL = espeakSILENCE;
	OUTPUT:
		RETVAL

IV
espeakRATE()
	CODE:
		RETVAL = espeakRATE;
	OUTPUT:
		RETVAL

IV
espeakVOLUME()
	CODE:
		RETVAL = espeakVOLUME;
	OUTPUT:
		RETVAL

IV
espeakPITCH()
	CODE:
		RETVAL = espeakPITCH;
	OUTPUT:
		RETVAL

IV
espeakRANGE()
	CODE:
		RETVAL = espeakRANGE;
	OUTPUT:
		RETVAL

IV
espeakPUNCTUATION()
	CODE:
		RETVAL = espeakPUNCTUATION;
	OUTPUT:
		RETVAL

IV
espeakCAPITALS()
	CODE:
		RETVAL = espeakCAPITALS;
	OUTPUT:
		RETVAL

IV
espeakEMPHASIS()
	CODE:
		RETVAL = espeakEMPHASIS;
	OUTPUT:
		RETVAL

IV
espeakLINELENGTH()
	CODE:
		RETVAL = espeakLINELENGTH;
	OUTPUT:
		RETVAL

IV
espeakVOICETYPE()
	CODE:
		RETVAL = espeakVOICETYPE;
	OUTPUT:
		RETVAL

IV
N_SPEECH_PARAM()
	CODE:
		RETVAL = N_SPEECH_PARAM;
	OUTPUT:
		RETVAL

IV
espeakPUNCT_NONE()
	CODE:
		RETVAL = espeakPUNCT_NONE;
	OUTPUT:
		RETVAL

IV
espeakPUNCT_ALL()
	CODE:
		RETVAL = espeakPUNCT_ALL;
	OUTPUT:
		RETVAL

IV
espeakPUNCT_SOME()
	CODE:
		RETVAL = espeakPUNCT_SOME;
	OUTPUT:
		RETVAL

IV
espeak_SetParameter(parameter, value, relative)
		IV		parameter
		int		value
		int		relative

IV
espeak_GetParameter(parameter, current)
		IV		parameter
		int		current

IV
espeak_SetPunctuationList(punctlist)
		const wchar_t *	punctlist

void
espeak_SetPhonemeTrace(value, stream)
		int		value
		FILE *		stream

void
espeak_CompileDictionary(path, log)
		const char *	path
		FILE *		log

const espeak_VOICE **
espeak_ListVoices(spec)
		SV *		spec
	PPCODE:
		const espeak_VOICE ** voices;
		if (sv_derived_from(spec, "Speech::eSpeak::VoicePtr")) {
			IV tmp = SvIV((SV*)SvRV(spec));
			Speech_eSpeak_Voice * voice_spec = INT2PTR(Speech_eSpeak_Voice *, tmp);
			voices = espeak_ListVoices(voice_spec);
			
		} else {
			voices = espeak_ListVoices(NULL);
		}
	
		AV* vs = newAV();
		int i = 0;
		while (voices[i]) {
			SV* vi = sv_newmortal();
			sv_setref_pv(vi, "Speech::eSpeak::VoicePtr", (void*)voices[i]);
			XPUSHs(vi);
			i++;
		}

IV
espeak_SetVoiceByName(name)
		const char *	name

IV
espeak_SetVoiceByProperties(voice_spec)
		Speech_eSpeak_Voice *		voice_spec

Speech_eSpeak_Voice *
espeak_GetCurrentVoice()

IV
espeak_Cancel()

int
espeak_IsPlaying()

IV
espeak_Synchronize()

IV
espeak_Terminate()

const char *
espeak_Info(ptr)
		void *		ptr

MODULE = Speech::eSpeak  PACKAGE = Speech::eSpeak::VoicePtr  PREFIX = voice_

void
voice_DESTROY(self)
		Speech_eSpeak_Voice *	self
	CODE:
		free(self);

char *
voice_name(self)
		Speech_eSpeak_Voice * self
        CODE:
                RETVAL = self->name;
        OUTPUT:
                RETVAL

char *
voice_languages(self)
                Speech_eSpeak_Voice *	self
        CODE:
                RETVAL = self->languages;
        OUTPUT:
                RETVAL

char *
voice_identifier(self)
                Speech_eSpeak_Voice *   self
        CODE:
                RETVAL = self->identifier;
        OUTPUT:
                RETVAL

unsigned char
voice_gender(self)
                Speech_eSpeak_Voice *   self
        CODE:
                RETVAL = self->gender;
        OUTPUT:
                RETVAL

unsigned char
voice_age(self)
                Speech_eSpeak_Voice *   self
        CODE:
                RETVAL = self->age;
        OUTPUT:
                RETVAL

unsigned char
voice_variant(self)
                Speech_eSpeak_Voice *   self
        CODE:
                RETVAL = self->variant;
        OUTPUT:
                RETVAL

unsigned char
voice_xx1(self)
                Speech_eSpeak_Voice *   self
        CODE:
                RETVAL = self->xx1;
        OUTPUT:
                RETVAL

int
voice_score(self)
                Speech_eSpeak_Voice *   self
        CODE:
                RETVAL = self->score;
        OUTPUT:
                RETVAL

void *
voice_spare(self)
                Speech_eSpeak_Voice *   self
        CODE:
                RETVAL = self->spare;
        OUTPUT:
                RETVAL

MODULE = Speech::eSpeak  PACKAGE = Speech::eSpeak::EventPtr  PREFIX = event_

void
event_DESTROY(self)
		Speech_eSpeak_Event *	self
	CODE:
		free(self);

IV
event_type(self)
		Speech_eSpeak_Event * self
        CODE:
                RETVAL = self->type;
        OUTPUT:
                RETVAL

unsigned int
event_unique_identifier(self)
                Speech_eSpeak_Event *	self
        CODE:
                RETVAL = self->unique_identifier;
        OUTPUT:
                RETVAL

int
event_text_position(self)
                Speech_eSpeak_Event *   self
        CODE:
                RETVAL = self->text_position;
        OUTPUT:
                RETVAL

int
event_length(self)
                Speech_eSpeak_Event *   self
        CODE:
                RETVAL = self->length;
        OUTPUT:
                RETVAL

int
event_audio_position(self)
                Speech_eSpeak_Event *   self
        CODE:
                RETVAL = self->audio_position;
        OUTPUT:
                RETVAL

int
event_sample(self)
                Speech_eSpeak_Event *   self
        CODE:
                RETVAL = self->sample;
        OUTPUT:
                RETVAL

void *
event_user_data(self)
                Speech_eSpeak_Event *   self
        CODE:
                RETVAL = self->user_data;
        OUTPUT:
                RETVAL

int
event_number(self)
                Speech_eSpeak_Event *   self
        CODE:
                RETVAL = (self->id).number;
        OUTPUT:
                RETVAL

const char *
event_name(self)
                Speech_eSpeak_Event *   self
        CODE:
                RETVAL = (self->id).name;
        OUTPUT:
                RETVAL