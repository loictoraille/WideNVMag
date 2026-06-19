function OpenAcqParameters(~,~)

global AcqParameters

assignin('base', 'AcqParameters', AcqParameters);
openvar('AcqParameters');

end