#pragma once

// Optionally unroll *all* loops, this might be faster, but might also be
// slower. Right now, every shader specifies on his own if he wants to unroll
// his loops or not.
// #pragma optionNV (unroll all)

#pragma include "$$PipelineTemp/$$ShaderAutoConfig.inc.glsl"
#pragma include "$$PipelineTemp/$$DayTimeConfig.inc.glsl"

// Screen size macro
#define SCREEN_SIZE vec2(WINDOW_WIDTH, WINDOW_HEIGHT)
#define SCREEN_SIZE_INT ivec2(WINDOW_WIDTH, WINDOW_HEIGHT)

// Plugin functions
#define HAVE_PLUGIN(PLUGIN_NAME) ( HAVE_PLUGIN_ ## PLUGIN_NAME )
#define GET_SETTING(PLUGIN_NAME, SETTING_NAME) ( PLUGIN_NAME ## __ ## SETTING_NAME )
#define GET_ENUM_VALUE(PLUGIN_NAME, SETTING_NAME, ENUM_KEY) ( PLUGIN_NAME ## _ENUM_ ## SETTING_NAME ## _ ## ENUM_KEY )
#define ENUM_V_ACTIVE(PLUGIN_NAME, SETTING_NAME, ENUM_KEY) ( GET_SETTING(PLUGIN_NAME, SETTING_NAME) == GET_ENUM_VALUE(PLUGIN_NAME, SETTING_NAME, ENUM_KEY) )

// Render mode functions
#define DEBUG_MODE ANY_DEBUG_MODE
#define MODE_ACTIVE(MODE_ID) ( DEBUG_MODE && ( _RM__ ## MODE_ID ) )

// Branch modes for translucency.
// This serves for the purpose to be enabled or disabled easily.
// Right now, it seems its faster not to branch. It heavily depends on
// the amount of translucent materials on the screen.
#if 0
#define BRANCH_TRANSLUCENCY(m) if (m.translucency > 0.01) {
#define END_BRANCH_TRANSLUCENCY() }
#else
#define BRANCH_TRANSLUCENCY(m)
#define END_BRANCH_TRANSLUCENCY()
#endif

#pragma include "CommonFunctions.inc.glsl"
