FROM glitchtip/glitchtip

ENV PORT=8000
EXPOSE 8000

CMD ["./bin/run-all-in-one.sh"]
