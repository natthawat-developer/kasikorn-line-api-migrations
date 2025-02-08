package config

import (
	logger "kasikorn-line-api-migrations/pkg/log"
	"os"

	"gopkg.in/yaml.v3"
)

type Config struct {
	DB struct {
		Driver   string `yaml:"driver"`
		Host     string `yaml:"host"`
		Port     int    `yaml:"port"`
		User     string `yaml:"user"`
		Password string `yaml:"password"`
		Name     string `yaml:"name"`
	} `yaml:"db"`
}

func LoadConfig() *Config {

	file, err := os.Open("config.yaml")
	if err != nil {
		logger.Logger.Error("Error opening config.yaml")
	}
	defer file.Close()

	var config Config
	decoder := yaml.NewDecoder(file)
	if err := decoder.Decode(&config); err != nil {
		logger.Error("Error decoding YAML")

	}

	return &config
}
