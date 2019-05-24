function [V,I] = nearest_value(choices,value)
%
% Bepaalt welke waarde uit "choices" het dichtst bij "value" ligt.
% Zowel de index (in choices) als de waarde zelf wordt geretourneerd.
%

 [V,I] = min(abs(choices - value)); 