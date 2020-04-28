#!/bin/bash
rm -rf dist/ build/ tmp/ var/
docker run --rm \
    -a stdout -a stderr \
    -v $(pwd):/io \
    quay.io/pypa/manylinux1_x86_64 bash /io/build-inside.sh


# rm -rf build/ tmp/ var/ maccorrection/
# LDFLAGS="-L$(brew --prefix openssl)/lib" CFLAGS="-I$(brew --prefix openssl)/include" python setup.py build --enable-dotnet --enable-dex --enable-macho
# python setup.py sdist
# python setup.py bdist_wheel

# pip install delocate
# mkdir maccorrection
# mv dist/*macosx*.whl maccorrection/

# delocate-wheel maccorrection/*.whl
# delocate-addplat --rm-orig -x 10_9 -x 10_10 maccorrection/*.whl
# cp maccorrection/*.whl dist/
# rm -rf maccorrection/
# pip uninstall delocate -y