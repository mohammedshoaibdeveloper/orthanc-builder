name=WVB
conf=osimis-webviewer
settings=(
	ANNOTATIONS_STORAGE_ENABLED
	COMBINED_TOOL_ENABLED
	CROSS_HAIR_ENABLED
	DEFAULT_SELECTED_TOOL
	DOWNLOAD_AS_JPEG_ENABLED
	INSTANCE_INFO_CACHE_ENABLED
	KEY_IMAGE_CAPTURE_ENABLED
	KEYBOARD_SHORTCUTS_ENABLED
	LANGUAGE
	OPEN_ALL_PATIENT_STUDIES
	PRINT_ENABLED
	REFERENCE_LINES_ENABLED
	SERIES_TO_IGNORE
	SYNCHRONIZED_BROWSING_ENABLED
	STUDY_DOWNLOAD_ENABLED
	TOGGLE_OVERLAY_TEXT_BUTTON_ENABLED
	VIDEO_ENABLED
)
plugin=libOsimisWebViewer

if [[ $WVB_ALPHA_ENABLED == true ]]; then
	plugin=libOsimisWebViewerAlpha
	WVB_ENABLED=true
fi

function genconf {
	cat <<-EOF >"$1"
	{
		"WebViewer": {
			"AnnotationStorageEnabled": ${ANNOTATIONS_STORAGE_ENABLED:-false},
			"CombinedToolEnabled": ${COMBINED_TOOL_ENABLED:-false},
			"CrossHairEnabled": ${CROSS_HAIR_ENABLED:-true},
			"DefaultLanguage": "${LANGUAGE:-en}",
			"DefaultSelectedTool": "${DEFAULT_SELECTED_TOOL:-zoom}",
			"DownloadAsJpegEnabled": ${DOWNLOAD_AS_JPEG_ENABLED:-false},
			"InstanceInfoCacheEnabled": ${INSTANCE_INFO_CACHE_ENABLED:-false},
			"KeyImageCaptureEnabled": ${KEY_IMAGE_CAPTURE_ENABLED:-false},
			"KeyboardShortcutsEnabled": ${KEYBOARD_SHORTCUTS_ENABLED:-true},
			"OpenAllPatientStudies": ${OPEN_ALL_PATIENT_STUDIES:-true},
			"PrintEnabled": ${PRINT_ENABLED:-true},
			"ReferenceLinesEnabled" : ${REFERENCE_LINES_ENABLED:-true},
			"SeriesToIgnore": ${SERIES_TO_IGNORE:-"{}"},
			"StudyDownloadEnabled": ${STUDY_DOWNLOAD_ENABLED:-true},
			"SynchronizedBrowsingEnabled": ${SYNCHRONIZED_BROWSING_ENABLED:-true},
			"ToggleOverlayTextButtonEnabled": ${TOGGLE_OVERLAY_TEXT_BUTTON_ENABLED:-false},
			"VideoDisplayEnabled": ${VIDEO_ENABLED:-true}
		}
	}
	EOF
}